package com.anatomyiq.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HealthLogRequest {
    private Double weightKg;
    private Double heightCm;
    private String bloodPressure;
    private Integer heartRate;
    private String notes;
}
