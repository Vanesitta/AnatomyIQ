package com.anatomyiq.service;

import com.anatomyiq.entity.User;
import com.anatomyiq.repository.UserRepository;
import com.anatomyiq.security.JwtUtil;
import com.anatomyiq.exception.BadRequestException;
import com.anatomyiq.exception.UnauthorizedException;
import com.anatomyiq.exception.NotFoundException;
import org.springframework.stereotype.Service;
import org.mindrot.jbcrypt.BCrypt;
import lombok.RequiredArgsConstructor;

import java.util.regex.Pattern;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;
    private final JwtUtil jwtUtil;

    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$", Pattern.CASE_INSENSITIVE);

    public User register(String username, String email, String password) {
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            throw new BadRequestException("All fields (username, email, password) are required.");
        }

        String normalizedEmail = email.trim().toLowerCase();

        if (!EMAIL_PATTERN.matcher(normalizedEmail).matches()) {
            throw new BadRequestException("Please enter a valid email address.");
        }

        if (repository.existsByUsername(username.trim())) {
            throw new BadRequestException("Username is already taken.");
        }

        if (repository.existsByEmail(normalizedEmail)) {
            throw new BadRequestException("Email is already registered.");
        }

        User user = new User();
        user.setUsername(username.trim());
        user.setEmail(normalizedEmail);
        user.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));

        return repository.save(user);
    }

    public String login(String email, String password) {
        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            throw new BadRequestException("Email and password are required.");
        }

        User user = repository.findByEmail(email.trim().toLowerCase())
                .orElseThrow(() -> new UnauthorizedException("Invalid email or password."));

        if (!BCrypt.checkpw(password, user.getPasswordHash())) {
            throw new UnauthorizedException("Invalid email or password.");
        }

        return jwtUtil.generateToken(user.getId());
    }

    public User getUserById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("User not found."));
    }

    public User getUserByEmail(String email) {
        return repository.findByEmail(email.trim().toLowerCase())
                .orElseThrow(() -> new NotFoundException("User with this email not found."));
    }
}
