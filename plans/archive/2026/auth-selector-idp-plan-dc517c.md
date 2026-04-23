# AuthSelector Cognito Redirect Plan
This plan describes the work needed to make the "Continue with IDP" action on `src/pages/AuthSelectorDemo/index.tsx` build the Cognito login URL from environment variables and redirect users appropriately.

## Steps
1. **Review current AuthSelectorDemo logic** – confirm how the buttons map to IDs, how state/status messaging works, and whether any shared utilities already exist for building auth URLs (e.g., check `Config` or other helpers) to avoid duplicating logic.
2. **Derive Cognito URL input data** – read `.env.dev` (and `import.meta.env` usage) to decide which variables to pull (`VITE_COGNITO_ENDPOINT`, `VITE_COGNITO_CLIENT_ID`, `VITE_COGNITO_REDIRECT_URL`) and lock in the fixed parameters (`response_type=code`, `scope=openid`, `state=returnUrl%3D%2F`). Document any encoding needs and fallbacks for missing vars.
3. **Implement redirect behavior** – update the Cognito branch of the button handler to stop the fake loading timer, compose the authorize URL with `encodeURIComponent`, and `window.location.assign(...)`; keep existing behavior for the CPALL CONNECT option intact and ensure status messaging still reflects the action until navigation occurs.
4. **Manual verification** – run the AuthSelectorDemo page locally (dev env) to click the Cognito option, confirm the browser navigates to the expected URL, and ensure the EKO option still behaves as before.
