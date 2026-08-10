package com.anatomyiq.controller;

import com.anatomyiq.entity.Organ;
import com.anatomyiq.service.OrganService;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/organs")
@RequiredArgsConstructor
public class OrganController {

    private final OrganService organService;

    @GetMapping("/{id}")
    public Organ getOrganById(@PathVariable Long id) {
        return organService.getOrganById(id);
    }
}
