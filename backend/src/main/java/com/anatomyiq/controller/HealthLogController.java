package com.anatomyiq.controller;

import com.anatomyiq.entity.HealthLog;
import com.anatomyiq.entity.User;
import com.anatomyiq.dto.HealthLogRequest;
import com.anatomyiq.service.HealthLogService;
import com.anatomyiq.service.UserService;
import com.anatomyiq.exception.UnauthorizedException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import java.util.List;

@RestController
@RequestMapping("/api/health-logs")
@RequiredArgsConstructor
public class HealthLogController {

    private final HealthLogService healthLogService;
    private final UserService userService;

    @GetMapping
    public List<HealthLog> getLogs(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        if (userId == null) {
            throw new UnauthorizedException("Access denied. Authentication required.");
        }
        return healthLogService.getLogsForUser(userId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public HealthLog createLog(@RequestBody HealthLogRequest requestDto, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        if (userId == null) {
            throw new UnauthorizedException("Access denied. Authentication required.");
        }
        User user = userService.getUserById(userId);
        return healthLogService.createLog(
                user,
                requestDto.getWeightKg(),
                requestDto.getHeightCm(),
                requestDto.getBloodPressure(),
                requestDto.getHeartRate(),
                requestDto.getNotes()
        );
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteLog(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        if (userId == null) {
            throw new UnauthorizedException("Access denied. Authentication required.");
        }
        healthLogService.deleteLog(id, userId);
    }
}
