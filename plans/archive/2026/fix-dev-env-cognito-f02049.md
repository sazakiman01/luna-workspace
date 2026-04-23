# Fix dev Cognito env usage
We need to ensure `npm run dev -- --mode dev` correctly pulls `VITE_COGNITO_*` values from `.env.dev` so the login URL is populated, not literal variable names.

1. **Diagnose env loading flow** – Inspect `vite.config.ts` and current `.env.dev` to confirm we load the right file for mode `dev` and that the values exist with `VITE_` prefix.
2. **Align env variables** – Either rename the newly added `COGNITO_*` to `VITE_COGNITO_*` or update Vite config to expose the new names so `import.meta.env` receives concrete strings.
3. **Verify URL generation** – Rebuild/restart dev server if needed, then check that clicking “Continue with CPALL IDP” produces the expected Cognito URL instead of placeholder tokens.
