package com.anatomyiq.controller;

import com.anatomyiq.entity.QuizQuestion;
import com.anatomyiq.entity.QuizSubmission;
import com.anatomyiq.dto.QuizSubmissionRequest;
import com.anatomyiq.dto.QuizSubmissionResponse;
import com.anatomyiq.service.QuizQuestionService;
import com.anatomyiq.exception.UnauthorizedException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import java.util.List;

@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
public class QuizController {

    private final QuizQuestionService quizQuestionService;

    @GetMapping("/organ/{organId}")
    public List<QuizQuestion> getQuizQuestionsByOrgan(@PathVariable Long organId) {
        return quizQuestionService.getQuestionsByOrgan(organId);
    }

    @PostMapping("/submit")
    public QuizSubmissionResponse submitQuiz(
            @RequestBody QuizSubmissionRequest request,
            HttpServletRequest servletRequest) {
        Long userId = (Long) servletRequest.getAttribute("userId");
        if (userId == null) {
            throw new UnauthorizedException("Access denied. Authentication required.");
        }
        return quizQuestionService.submitQuiz(request, userId);
    }

    @GetMapping("/history")
    public List<QuizSubmission> getQuizHistory(HttpServletRequest servletRequest) {
        Long userId = (Long) servletRequest.getAttribute("userId");
        if (userId == null) {
            throw new UnauthorizedException("Access denied. Authentication required.");
        }
        return quizQuestionService.getQuizHistory(userId);
    }
}
