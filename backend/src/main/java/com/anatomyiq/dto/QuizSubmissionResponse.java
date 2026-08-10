package com.anatomyiq.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuizSubmissionResponse {
    private Long organId;
    private int totalQuestions;
    private int correctAnswers;
    private double scorePercentage;
}
