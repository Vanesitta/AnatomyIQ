package com.anatomyiq.entity;

import jakarta.persistence.*;
import lombok.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;

@Entity
@Table(name = "organs")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Organ {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "system_id", nullable = false)
    @JsonIgnore
    private BodySystem bodySystem;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String functions;

    @Column(name = "image_url", length = 255)
    private String imageUrl;

    @Column(name = "study_notes", columnDefinition = "TEXT")
    private String studyNotes;

    @OneToMany(mappedBy = "organ", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<QuizQuestion> quizQuestions;

    public Long getSystemId() {
        return bodySystem != null ? bodySystem.getId() : null;
    }

    public String getSystemName() {
        return bodySystem != null ? bodySystem.getName() : null;
    }
}
