package com.anatomyiq.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
public class RootController {

    @GetMapping({"/", "/health"})
    public Map<String, Object> getHealthStatus() {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("message", "AnatomyIQ Backend is running successfully");
        response.put("timestamp", System.currentTimeMillis());
        return response;
    }
}
