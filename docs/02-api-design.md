# REST API Specifications - AnatomyIQ

This document details the REST API endpoints exposed by the Spring Boot backend to support the AnatomyIQ Next.js client.

## API Endpoint Table

| Controller | Method | Path | Request Body (JSON) | Response Body (JSON) | Auth Required | Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **AuthController** | `POST` | `/api/auth/register` | `{"username": "jdoe", "email": "john@example.com", "password": "password123"}` | `{"id": 1, "username": "jdoe", "email": "john@example.com"}` | **No** | Register a new user account. |
| | `POST` | `/api/auth/login` | `{"email": "john@example.com", "password": "password123"}` | `{"token": "eyJhbGciOi...", "username": "jdoe", "email": "john@example.com"}` | **No** | Authenticate credentials and return JWT token. |
| **BodySystemController** | `GET` | `/api/systems` | *None* | `[{"id": 1, "name": "Circulatory System", "description": "Responsible for blood flow..."}]` | **No** | Get all human body systems. |
| | `GET` | `/api/systems/{id}` | *None* | `{"id": 1, "name": "Circulatory System", "description": "...", "organs": [{"id": 1, "name": "Heart", "description": "Pumps blood..."}]}` | **No** | Get detailed body system with nested organs. |
| **OrganController** | `GET` | `/api/organs/{id}` | *None* | `{"id": 1, "systemId": 1, "name": "Heart", "description": "...", "functions": "Pumps oxygenated blood...", "imageUrl": "/images/heart.png"}` | **No** | Get detailed physiological and anatomical info for an organ. |
| **QuizController** | `GET` | `/api/quiz/organ/{organId}` | *None* | `[{"id": 1, "organId": 1, "questionText": "What pumps blood?", "optionA": "Lung", "optionB": "Heart", "optionC": "Liver", "optionD": "Brain", "correctOption": "B", "explanation": "The heart is the main circulatory pump."}]` | **No** | Get a list of quiz questions associated with an organ. |
| | `POST` | `/api/quiz/submit` | `{"organId": 1, "answers": [{"questionId": 1, "selectedOption": "B"}]}` | `{"organId": 1, "totalQuestions": 1, "correctAnswers": 1, "scorePercentage": 100.0}` | **Yes** (JWT) | Submit quiz answers for scoring and evaluation. |
| **HealthLogController** | `GET` | `/api/health-logs` | *None* | `[{"id": 1, "userId": 1, "logDate": "2026-07-16", "weightKg": 70.0, "heightCm": 175.0, "bmi": 22.86, "bloodPressure": "120/80", "heartRate": 72, "notes": "Feeling great!"}]` | **Yes** (JWT) | List all health parameter logs for the authenticated user (sorted by date desc). |
| | `POST` | `/api/health-logs` | `{"weightKg": 72.0, "heightCm": 175.0, "bloodPressure": "122/81", "heartRate": 75, "notes": "After morning run"}` | `{"id": 2, "userId": 1, "logDate": "2026-07-16", "weightKg": 72.0, "heightCm": 175.0, "bmi": 23.51, "bloodPressure": "122/81", "heartRate": 75, "notes": "After morning run"}` | **Yes** (JWT) | Add a new health log entry. BMI is calculated server-side on creation. |
| | `DELETE` | `/api/health-logs/{id}` | *None* | *None* (HTTP 204 No Content) | **Yes** (JWT) | Delete a specific health log entry belonging to the authenticated user. |

## Common Formats & Security

1. **Authentication Header**: Required endpoints expect a JSON Web Token (JWT) sent via HTTP Authorization Header as a Bearer token:
   ```http
   Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
   ```
2. **Error Responses**: Standard HTTP status codes are used to communicate success or failure:
   - `200 OK`: Successful retrieval or action execution.
   - `201 Created`: Successfully created a resource (e.g., register, health log post).
   - `204 No Content`: Successful deletion.
   - `400 Bad Request`: Validation failure or malformed JSON payloads.
   - `401 Unauthorized`: Invalid or missing authentication credentials/JWT token.
   - `403 Forbidden`: Authenticated user does not own or have permission to access the target resource (e.g., trying to view/delete another user's health logs).
   - `404 Not Found`: Target resource (system, organ, health log) does not exist.
   - `500 Internal Server Error`: Generic unhandled server exceptions.
