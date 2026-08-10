package com.anatomyiq.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Table(name = "body_systems")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BodySystem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @OneToMany(mappedBy = "bodySystem", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Organ> organs;
}
