package com.anatomyiq.service;

import com.anatomyiq.entity.Organ;
import com.anatomyiq.repository.OrganRepository;
import com.anatomyiq.exception.NotFoundException;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrganService {

    private final OrganRepository repository;

    public Organ getOrganById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Organ not found."));
    }
}
