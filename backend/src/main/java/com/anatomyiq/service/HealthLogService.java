package com.anatomyiq.service;

import com.anatomyiq.entity.HealthLog;
import com.anatomyiq.entity.User;
import com.anatomyiq.repository.HealthLogRepository;
import com.anatomyiq.exception.BadRequestException;
import com.anatomyiq.exception.NotFoundException;
import com.anatomyiq.exception.ForbiddenException;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class HealthLogService {

    private final HealthLogRepository repository;

    public List<HealthLog> getLogsForUser(Long userId) {
        return repository.findByUser_IdOrderByLogDateDesc(userId);
    }

    public HealthLog createLog(User user, Double weightKg, Double heightCm, String bloodPressure, Integer heartRate, String notes) {
        if (weightKg == null || heightCm == null) {
            throw new BadRequestException("Weight (kg) and height (cm) are required.");
        }

        if (weightKg <= 0 || heightCm <= 0) {
            throw new BadRequestException("Weight and height must be strictly positive values greater than zero.");
        }

        if (weightKg < 1.0 || weightKg > 1000.0) {
            throw new BadRequestException("Weight must be between 1 and 1000 kg.");
        }

        if (heightCm < 30.0 || heightCm > 300.0) {
            throw new BadRequestException("Height must be in centimeters (e.g. 175) and between 30 and 300 cm.");
        }

        if (bloodPressure != null && bloodPressure.length() > 15) {
            throw new BadRequestException("Blood pressure string must be 15 characters or less.");
        }

        if (heartRate != null && (heartRate < 30 || heartRate > 250)) {
            throw new BadRequestException("Heart rate must be between 30 and 250 bpm.");
        }

        HealthLog log = new HealthLog();
        log.setUser(user);
        log.setLogDate(LocalDate.now());
        log.setWeightKg(weightKg);
        log.setHeightCm(heightCm);

        // BMI: weight_kg / (height_m)^2
        double heightM = heightCm / 100.0;
        double bmiVal = weightKg / (heightM * heightM);
        bmiVal = Math.round(bmiVal * 100.0) / 100.0; // round to 2 decimal places
        log.setBmi(bmiVal);

        log.setBloodPressure(bloodPressure);
        log.setHeartRate(heartRate);
        log.setNotes(notes);

        return repository.save(log);
    }

    public void deleteLog(Long logId, Long userId) {
        HealthLog log = repository.findById(logId)
                .orElseThrow(() -> new NotFoundException("Health log not found."));

        if (!log.getUser().getId().equals(userId)) {
            throw new ForbiddenException("You are not authorized to delete this health log.");
        }

        repository.delete(log);
    }
}
