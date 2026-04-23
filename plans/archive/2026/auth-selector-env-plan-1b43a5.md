# Plan: Update .env.dev for Cognito Login
This plan outlines how to expose the DEV Cognito (IDP) settings to the frontend via `.env.dev` while keeping the configuration consistent and safe.

1. **Audit current env usage**  
   - Review `src/config.ts` and any auth-related helpers to confirm which environment keys are already read and whether Cognito-specific values are referenced.  
   - Identify whether the frontend really needs the client secret (likely not) or if only the endpoint, token endpoint, redirect URL, and client ID should be exposed to avoid leaking sensitive data.

2. **Define VITE_* variable names**  
   - Propose explicit keys such as `VITE_COGNITO_ENDPOINT`, `VITE_COGNITO_TOKEN_ENDPOINT`, `VITE_COGNITO_REDIRECT_URL`, `VITE_COGNITO_CLIENT_ID`, and (if unavoidable) `VITE_COGNITO_CLIENT_SECRET`.  
   - Document the mapping from the provided values to each key, including any comments indicating that the data powers the “Continue with IDP” option.

3. **Update `.env.dev` safely**  
   - Insert the new variables under a `# Cognito (IDP)` section after the existing EKO settings, keeping formatting consistent (one key per line, use quoted URLs only if required).  
   - If the client secret must be stored, add a cautionary comment noting it is for DEV only and ensure the file stays untracked outside local dev.

4. **Plan follow-up integration**  
   - Note the places in code that will need to read these new envs (`config.ts` or specific auth modules) so that subsequent implementation work is clear.  
   - Outline a quick manual test checklist (run `npm run dev`, load `/auth-selector-demo`, click “Continue with IDP” and watch the network flow) once the code is wired to these envs.
