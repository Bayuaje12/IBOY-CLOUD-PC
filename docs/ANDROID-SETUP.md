# Setup from Android

## GitHub web upload
1. Extract the ZIP on Android using your file manager.
2. Create a repository named `IBOY-CLOUD-PC` on GitHub.
3. Upload the extracted files and folders, not the ZIP as a single source file.
4. Keep `.github/workflows/iboy-cloud-pc.yml` at exactly that path.
5. Commit to the `main` branch.
6. Open the repository's Actions tab and run the workflow manually.

## Termux Git upload
Install Git with `pkg install git`, extract the project into a directory, then run the commands in the main README. Use GitHub's supported browser/device authentication. Never commit access tokens.
