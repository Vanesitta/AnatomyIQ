# AnatomyIQ - Phase 5: Evaluation Document

This document presents the evaluation framework for **AnatomyIQ**, incorporating performance benchmarking guidelines, system scope limitations, and a structured end-to-end user testing plan.

---

## 1. Performance Metrics

This section establishes performance tracking for key web application workflows. Measurement methodology and metrics logging templates are outlined below.

### 1.1 Measurement Methodology
Load times and latency metrics should be recorded using one of the following methods:
* **Browser Developer Tools (Network Tab)**: Open Chrome/Firefox DevTools (`F12` -> Network tab), disable cache, and record the `Finish` / `DOMContentLoaded` time or specific REST endpoint response duration (`XHR/Fetch`).
* **Console Timestamps / Performance API**: Log navigation start to component render complete timestamps via `performance.now()`.

### 1.2 Performance Benchmark Matrix

> **Important**: The actual performance values are intentionally left as placeholders (`[Pending]`) to be populated following manual execution and measurement in your environment.

| Core Interaction / Workflow | Target Benchmark | Measured Load Time (ms) | Network Requests Count | Status & Observation |
| :--- | :---: | :---: | :---: | :--- |
| **Systems Overview Page (`/systems`)** | `< 1,000 ms` | `190 ms (initial HTML) / 2540 ms (full load)` | `12` | Fetch system list & render cards. |
| **Organ Detail Page (`/organs/[id]`)** | `< 1,000 ms` | `175 ms (repeat visit) / ~2540 ms (first-load, includes dev-server compile)` | `2 (cached) / 11 (first load)` | Fetch organ facts, parent system link, & diagram. |
| **Quiz Submission (`/quiz/[organId]`)** | `< 500 ms` | `[Pending]` | `[Pending]` | Process POST payload, calculate score, & render result modal. |
| **Analytics Dashboard (`/analytics`)** | `< 1,500 ms` | `[Pending]` | `[Pending]` | Aggregate health logs & historical quiz submissions into charts. |
| **Authentication Flow (`/login` / `/register`)** | `< 800 ms` | `[Pending]` | `[Pending]` | Execute auth API call, set JWT/session state, & redirect. |

---

## 2. Known Limitations

The following scope boundaries and design constraints describe the current state of AnatomyIQ:

1. **Single Quiz Difficulty Level**:
   - Quizzes feature a uniform difficulty baseline across all bodily systems. Adaptive difficulty adjustments or configurable difficulty tiers (e.g., Novice vs. Advanced) are currently not implemented.
2. **Fixed Question Quantity per Organ**:
   - Each organ contains a fixed set of 10 pre-configured assessment questions. Dynamic question generation or randomized multi-pool sampling is outside current scope.
3. **Local-Only Deployment**:
   - The application is optimized for local environment hosting (`localhost:3000` Next.js frontend, `localhost:8080` Spring Boot backend, local H2/PostgreSQL database). Production deployment features such as cloud CDN asset distribution, HTTPS/SSL certificates, and remote server scaling are omitted.
4. **Client-Side Storage Authentication**:
   - User authentication state is maintained via JWT stored in browser local storage. Advanced features like refresh token rotation or automatic multi-tab session expiration are not included.
5. **Synchronous Data Aggregation**:
   - Analytics metrics (e.g. average quiz scores by system/organ, biometric timelines) are calculated on-the-fly when requested rather than pre-aggregated into analytical database tables or cached in-memory.

---

## 3. User Testing Plan

A structured, 6-step testing walkthrough designed for an evaluator unfamiliar with the AnatomyIQ platform to assess usability, functional flow, and identify potential bugs or UI friction points.

### 3.1 Execution Instructions for Testers
1. Follow each task in sequence starting from an unauthenticated browser state.
2. Mark the **Status** as **Pass** if the expected outcome is achieved, or **Fail** if blocked.
3. Record any moments of confusion, unexpected interface behaviors, or software defects in the designated columns.

### 3.2 User Testing Checklist & Feedback Matrix

| Task # | Step / Task Description | Expected Outcome | Status (Pass/Fail) | Confusion / Usability Friction | Bugs / Technical Issues Found |
| :---: | :--- | :--- | :---: | :--- | :--- |
| **1** | **User Registration & Login**<br>Navigate to `/register`, create a new user account, and log in via `/login`. | Account is successfully created, JWT stored, user lands on `/systems`. | `[Pending]` | `[Pending]` | `[Pending]` |
| **2** | **System & Organ Exploration**<br>Browse the `/systems` page, select **Skeletal System**, and open the **Skull** organ detail page. | Systems load cleanly; clicking Skeletal System opens its page; Skull organ detail page displays anatomical content. | `[Pending]` | `[Pending]` | `[Pending]` |
| **3** | **Quiz Execution & Submission**<br>Click **Take Quiz** on the Skull organ page, answer all 10 questions, and submit. | Quiz progresses through all 10 questions, submits payload, and displays accurate percentage score summary. | `[Pending]` | `[Pending]` | `[Pending]` |
| **4** | **Biometric Health Logging**<br>Navigate to `/health-log`, input weight, height, blood pressure, heart rate, and submit the entry. | Health record saves to backend, automatic BMI computation occurs, and log list refreshes. | `[Pending]` | `[Pending]` | `[Pending]` |
| **5** | **Analytics & Progress Review**<br>Navigate to `/analytics` and switch between **Biometrics Tracking** and **Learning Progress** tabs. | Charts (Recharts) render weight/BMI trends and quiz performance by organ/system accurately. | `[Pending]` | `[Pending]` | `[Pending]` |
| **6** | **Logout & Route Protection**<br>Click **Logout** in the navigation header, then attempt to access `/analytics` directly via address bar. | User session clears, local storage token removed, and unauthorized access to `/analytics` redirects to `/login`. | `[Pending]` | `[Pending]` | `[Pending]` |

---

## 4. Evaluation Summary Template

Following manual execution of the evaluation plan, complete the summary below:

* **Overall User Experience Score**: `[Pending / Out of 10]`
* **Total Bugs Identified**: `[Pending / Count]`
* **Key Usability Takeaways**:
  - `[Pending note 1]`
  - `[Pending note 2]`
