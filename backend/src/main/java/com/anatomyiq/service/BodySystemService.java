package com.anatomyiq.service;

import com.anatomyiq.entity.BodySystem;
import com.anatomyiq.repository.BodySystemRepository;
import com.anatomyiq.exception.NotFoundException;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BodySystemService {

    private final BodySystemRepository repository;

    public List<BodySystem> getAllSystems() {
        return repository.findAll();
    }

    public BodySystem getSystemById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Body system not found."));
    }
}
