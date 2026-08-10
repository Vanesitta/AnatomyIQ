package com.anatomyiq.controller;

import com.anatomyiq.entity.BodySystem;
import com.anatomyiq.service.BodySystemService;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import java.util.List;

@RestController
@RequestMapping("/api/systems")
@RequiredArgsConstructor
public class BodySystemController {

    private final BodySystemService bodySystemService;

    @GetMapping
    public List<BodySystem> getAllSystems() {
        return bodySystemService.getAllSystems();
    }

    @GetMapping("/{id}")
    public BodySystem getSystemById(@PathVariable Long id) {
        return bodySystemService.getSystemById(id);
    }
}
