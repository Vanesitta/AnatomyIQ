-- PostgreSQL Schema Definitions for AnatomyIQ

-- Drop existing tables to ensure clean initialization
DROP TABLE IF EXISTS health_logs CASCADE;
DROP TABLE IF EXISTS quiz_submissions CASCADE;
DROP TABLE IF EXISTS quiz_questions CASCADE;
DROP TABLE IF EXISTS organs CASCADE;
DROP TABLE IF EXISTS body_systems CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- 1. Users Table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Body Systems Table
CREATE TABLE body_systems (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT NOT NULL
);

-- 3. Organs Table
CREATE TABLE organs (
    id BIGSERIAL PRIMARY KEY,
    system_id BIGINT NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    functions TEXT NOT NULL,
    image_url VARCHAR(255),
    study_notes TEXT,
    CONSTRAINT fk_organ_system FOREIGN KEY (system_id) REFERENCES body_systems(id) ON DELETE CASCADE
);

-- 4. Quiz Questions Table
CREATE TABLE quiz_questions (
    id BIGSERIAL PRIMARY KEY,
    organ_id BIGINT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL,
    explanation TEXT,
    CONSTRAINT fk_quiz_question_organ FOREIGN KEY (organ_id) REFERENCES organs(id) ON DELETE CASCADE,
    CONSTRAINT chk_correct_option CHECK (correct_option IN ('A', 'B', 'C', 'D'))
);

-- 5. Health Logs Table (BMI tracker, weight/height)
CREATE TABLE health_logs (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    log_date DATE NOT NULL DEFAULT CURRENT_DATE,
    weight_kg NUMERIC(5, 2) NOT NULL,
    height_cm NUMERIC(5, 2) NOT NULL,
    bmi NUMERIC(4, 2) NOT NULL,
    blood_pressure VARCHAR(15),
    heart_rate INTEGER,
    notes TEXT,
    CONSTRAINT fk_health_log_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_weight_positive CHECK (weight_kg > 0),
    CONSTRAINT chk_height_positive CHECK (height_cm > 0),
    CONSTRAINT chk_bmi_positive CHECK (bmi > 0)
);

-- 6. Quiz Submissions Table
CREATE TABLE quiz_submissions (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    organ_id BIGINT NOT NULL,
    score_percentage NUMERIC(5, 2) NOT NULL,
    completed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_quiz_submission_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_quiz_submission_organ FOREIGN KEY (organ_id) REFERENCES organs(id) ON DELETE CASCADE
);

-- Create Indexes for performance optimization on Foreign Keys
CREATE INDEX idx_organs_system_id ON organs(system_id);
CREATE INDEX idx_quiz_questions_organ_id ON quiz_questions(organ_id);
CREATE INDEX idx_health_logs_user_id ON health_logs(user_id);
CREATE INDEX idx_quiz_submissions_user_id ON quiz_submissions(user_id);
