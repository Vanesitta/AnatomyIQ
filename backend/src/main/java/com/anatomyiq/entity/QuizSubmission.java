package com.anatomyiq.entity;

import jakarta.persistence.*;
import lombok.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.time.LocalDateTime;

@Entity
@Table(name = "quiz_submissions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuizSubmission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    @JsonIgnore
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organ_id", nullable = false)
    @JsonIgnore
    private Organ organ;

    @Column(name = "score_percentage", nullable = false)
    private Double scorePercentage;

    @Column(name = "completed_at", nullable = false)
    private LocalDateTime completedAt;

    public Long getUserId() {
        return user != null ? user.getId() : null;
    }

    public Long getOrganId() {
        return organ != null ? organ.getId() : null;
    }

    public String getOrganName() {
        return organ != null ? organ.getName() : null;
    }

    public String getSystemName() {
        return organ != null ? organ.getSystemName() : null;
    }
}
