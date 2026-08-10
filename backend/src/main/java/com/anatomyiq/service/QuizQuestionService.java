package com.anatomyiq.service;

import com.anatomyiq.entity.QuizQuestion;
import com.anatomyiq.entity.QuizSubmission;
import com.anatomyiq.entity.User;
import com.anatomyiq.entity.Organ;
import com.anatomyiq.repository.QuizQuestionRepository;
import com.anatomyiq.repository.QuizSubmissionRepository;
import com.anatomyiq.repository.UserRepository;
import com.anatomyiq.repository.OrganRepository;
import com.anatomyiq.dto.QuizSubmissionRequest;
import com.anatomyiq.dto.QuizSubmissionResponse;
import com.anatomyiq.dto.AnswerDto;
import com.anatomyiq.exception.BadRequestException;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuizQuestionService {

    private final QuizQuestionRepository repository;
    private final QuizSubmissionRepository quizSubmissionRepository;
    private final UserRepository userRepository;
    private final OrganRepository organRepository;

    public List<QuizQuestion> getQuestionsByOrgan(Long organId) {
        List<QuizQuestion> allQuestions = repository.findByOrgan_Id(organId);
        java.util.Collections.shuffle(allQuestions);
        return allQuestions.subList(0, Math.min(allQuestions.size(), 10));
    }

    public QuizSubmissionResponse submitQuiz(QuizSubmissionRequest request, Long userId) {
        if (request.getOrganId() == null || request.getAnswers() == null) {
            throw new BadRequestException("Organ ID and answers list are required.");
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException("User not found with ID: " + userId));

        Organ organ = organRepository.findById(request.getOrganId())
                .orElseThrow(() -> new BadRequestException("Organ not found with ID: " + request.getOrganId()));

        List<QuizQuestion> questions = repository.findByOrgan_Id(request.getOrganId());
        if (questions.isEmpty()) {
            throw new BadRequestException("No questions found for the given organ.");
        }

        int correct = 0;
        int answeredCount = 0;
        for (AnswerDto ans : request.getAnswers()) {
            if (ans.getQuestionId() == null || ans.getSelectedOption() == null) {
                continue;
            }
            Optional<QuizQuestion> qOpt = questions.stream()
                    .filter(q -> q.getId().equals(ans.getQuestionId()))
                    .findFirst();
            if (!qOpt.isPresent()) {
                qOpt = repository.findById(ans.getQuestionId())
                        .filter(q -> q.getOrgan() != null && q.getOrgan().getId().equals(request.getOrganId()));
            }
            if (qOpt.isPresent()) {
                answeredCount++;
                QuizQuestion q = qOpt.get();
                if (q.getCorrectOption() != null && ans.getSelectedOption() != null &&
                    q.getCorrectOption().trim().equalsIgnoreCase(ans.getSelectedOption().trim())) {
                    correct++;
                }
            }
        }

        int total = answeredCount > 0 ? answeredCount : (request.getAnswers() != null && !request.getAnswers().isEmpty() ? request.getAnswers().size() : 1);
        double percent = ((double) correct / total) * 100.0;
        percent = Math.round(percent * 100.0) / 100.0; // round to 2 decimal places

        // Save submission to database
        QuizSubmission submission = new QuizSubmission();
        submission.setUser(user);
        submission.setOrgan(organ);
        submission.setScorePercentage(percent);
        submission.setCompletedAt(LocalDateTime.now());
        quizSubmissionRepository.save(submission);

        return new QuizSubmissionResponse(request.getOrganId(), total, correct, percent);
    }

    public List<QuizSubmission> getQuizHistory(Long userId) {
        return quizSubmissionRepository.findByUser_IdOrderByCompletedAtAsc(userId);
    }
}
