package com.anatomyiq.controller;

import com.anatomyiq.entity.User;
import com.anatomyiq.dto.RegisterRequest;
import com.anatomyiq.dto.LoginRequest;
import com.anatomyiq.dto.LoginResponse;
import com.anatomyiq.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public User register(@RequestBody RegisterRequest request) {
        return userService.register(
                request.getUsername(),
                request.getEmail(),
                request.getPassword()
        );
    }

    @PostMapping("/login")
    public LoginResponse login(@RequestBody LoginRequest request) {
        String token = userService.login(request.getEmail(), request.getPassword());
        User user = userService.getUserByEmail(request.getEmail());
        return new LoginResponse(token, user.getUsername(), user.getEmail());
    }
}
