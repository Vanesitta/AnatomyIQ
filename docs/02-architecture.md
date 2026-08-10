# System Architecture - AnatomyIQ

AnatomyIQ utilizes a classic layered architecture with a modern, decoupled frontend and backend stack.

## Architecture Diagram

The diagram below details the interaction flow from user-facing components down to the relational database:

```mermaid
flowchart TB
    subgraph Presentation_Layer ["Presentation Layer (Next.js App Router)"]
        direction TB
        ServerComp["Server Components (Static/Server Rendering)<br>- Systems List (/)<br>- System Details (/systems/[id])<br>- Organ Details (/organs/[id])"]
        ClientComp["Client Components (Interactive UX)<br>- Login/Register Forms<br>- Quiz Interface (/quiz/[organId])<br>- Health Log Form (/health-log)<br>- Analytics Dashboards (/analytics)"]
    end

    subgraph API_Layer ["API Layer (Spring Boot Controllers)"]
        direction LR
        AuthController["AuthController"]
        BodySystemController["BodySystemController"]
        OrganController["OrganController"]
        QuizController["QuizController"]
        HealthLogController["HealthLogController"]
    end

    subgraph Service_Layer ["Service Layer (Spring Boot Services)"]
        direction LR
        UserService["UserService"]
        BodySystemService["BodySystemService"]
        OrganService["OrganService"]
        QuizQuestionService["QuizQuestionService"]
        HealthLogService["HealthLogService"]
    end

    subgraph Data_Access_Layer ["Data Access Layer (Spring Data JPA)"]
        direction LR
        UserRepository["UserRepository"]
        BodySystemRepository["BodySystemRepository"]
        OrganRepository["OrganRepository"]
        QuizQuestionRepository["QuizQuestionRepository"]
        HealthLogRepository["HealthLogRepository"]
    end

    subgraph Database_Layer ["Database Layer (PostgreSQL)"]
        PostgreSQL[("PostgreSQL Database")]
    end

    %% Flow arrows
    ServerComp -->|HTTP REST Requests| API_Layer
    ClientComp -->|HTTP REST Requests / JWT| API_Layer

    AuthController --> UserService
    BodySystemController --> BodySystemService
    OrganController --> OrganService
    QuizController --> QuizQuestionService
    HealthLogController --> HealthLogService

    UserService --> UserRepository
    BodySystemService --> BodySystemRepository
    OrganService --> OrganRepository
    QuizQuestionService --> QuizQuestionRepository
    HealthLogService --> HealthLogRepository

    UserRepository --> PostgreSQL
    BodySystemRepository --> PostgreSQL
    OrganRepository --> PostgreSQL
    QuizQuestionRepository --> PostgreSQL
    HealthLogRepository --> PostgreSQL
```

## Layer Explanations

1. **Presentation Layer (Next.js)**: Responsible for rendering the user interface and handling routing. Next.js App Router uses **Server Components** for performant server-side data fetching and static optimization (e.g. browsing body systems and organ details) and **Client Components** for stateful page interactions (e.g., answering quiz questions, logging health parameters, authentication forms).
2. **API Layer (Spring Boot Controllers)**: REST controllers expose endpoints to process HTTP request actions, handle CORS, and secure resources via JWT token validation.
3. **Service Layer (Spring Boot Services)**: Houses business logic, manages transaction boundaries, and coordinates between controller requests and data access rules.
4. **Data Access Layer (Spring Data JPA)**: Provides interfaces that abstract database queries away via JPA/Hibernate implementations, mapping database records straight into Java Entity domain models.
5. **Database Layer (PostgreSQL)**: Serves as the persistence engine, housing structural data tables with clean schema constraints and relations.
