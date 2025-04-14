# Przepisy 2.0

## Table of Contents
1. [Project Description](#project-description)
2. [Tech Stack](#tech-stack)
3. [Getting Started Locally](#getting-started-locally)
4. [Available Scripts](#available-scripts)
5. [Project Scope](#project-scope)
6. [Project Status](#project-status)
7. [License](#license)

## Project Description
Przepisy 2.0 is a responsive web platform designed to quickly generate recipes based on available ingredients. It aims to provide cooking inspiration while minimizing food waste. The application offers two main user paths: 
- **Unregistered Users:** Can generate recipes based on a one-time ingredient input.
- **Registered Users:** Have access to additional functionalities such as managing personal ingredient lists, generating recipes from saved lists, and saving generated recipes.

## Tech Stack
- **Frontend:** 
  - Astro 5
  - React 19
  - TypeScript 5
  - Tailwind CSS 4
  - Shadcn/ui
- **Backend:** Supabase (PostgreSQL, built-in authentication)
- **AI Integration:** Openrouter.ai for AI-driven recipe generation
- **CI/CD and Hosting:** 
  - GitHub Actions for automated testing and deployment
  - DigitalOcean with Docker for hosting

## Getting Started Locally
To set up the project locally, follow these steps:

1. **Ensure you have Node.js version 22.14.0 installed.** You can use nvm to manage Node.js versions:
   ```bash
   nvm install 22.14.0
   nvm use 22.14.0
   ```

2. **Clone the repository:**
   ```bash
   git clone https://github.com/kguzik/recipes.git
   cd recipes
   ```

3. **Install dependencies:**
   ```bash
   npm install
   ```

4.  **Set up environment variables:**
    Copy the example environment file:
    ```bash
    cp .env.example .env
    ```
    Then, open the `.env` file and fill in the required values for `SUPABASE_URL`, `SUPABASE_KEY`, and `OPENROUTER_API_KEY`.

5.  **Run the development server:**
    ```bash
    npm run dev
    ```

6.  **Ensure you have the following VS Code plugins installed:**
    -   Astro
    -   ESLint
    -   Prettier

## Available Scripts
- `npm run dev`: Start the development server.
- `npm run build`: Build the project for production.
- `npm run preview`: Preview the production build.
- `npm run lint`: Run ESLint to check for code quality issues.
- `npm run lint:fix`: Automatically fix linting issues.
- `npm run format`: Format the code using Prettier.

## Project Scope
The MVP includes:
- Recipe generation based on ingredient input for both unregistered and registered users.
- User registration and login integrated with Supabase.
- Management of personal ingredient lists and saving generated recipes.
- A simple, responsive user interface.

## Project Status
The project is currently in the MVP stage, focusing on core functionalities. Future plans include expanding features and improving user experience.

## License
MIT
