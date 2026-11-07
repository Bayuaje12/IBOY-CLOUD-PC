# IBOY CLOUD PC
**Creator: Bayu**  
Temporary Windows automation project using GitHub Actions `windows-2025`.

> **Important:** This repository automates configuration tasks on a GitHub-hosted Windows runner. It does **not** provide an interactive RDP desktop, persistent cloud PC, or a supported way to tunnel into a GitHub-hosted runner. GitHub-hosted runners are temporary CI machines. Use this project for Windows configuration, validation, and artifact generation only.

## Features
- Windows PowerShell automation.
- Copies `assets/wallpaper.jpg` into the current runner user's profile.
- Applies Windows dark-mode registry preferences for the current runner user.
- Creates a desktop configuration manifest.
- Runs diagnostics and uploads a report artifact.
- No API keys or credentials required.

## Repository structure
```text
IBOY-CLOUD-PC/
├── assets/wallpaper.jpg
├── config/desktop.json
├── scripts/
│   ├── Install-Desktop.ps1
│   ├── Apply-Desktop.ps1
│   ├── Setup-Tailscale.ps1
│   └── Setup-Remote.ps1
├── docs/
│   ├── ARCHITECTURE.md
│   ├── ANDROID-SETUP.md
│   ├── REMOTE-ACCESS.md
│   └── TROUBLESHOOTING.md
├── .github/workflows/iboy-cloud-pc.yml
├── .gitignore
├── LICENSE
└── README.md
```

## Replace the sample wallpaper
The included `assets/wallpaper.jpg` is a branded sample image, not your personal photo.
1. Open the repository on GitHub from Android.
2. Open `assets/wallpaper.jpg` and choose the edit/upload option, or delete it and upload your own JPG using the same exact filename.
3. Commit the change.
4. Run the workflow again.

Recommended image: JPG, 16:9, at least 1920×1080. Do not upload private or sensitive images to a public repository.

## Run from Android
1. Create a GitHub repository named `IBOY-CLOUD-PC`.
2. Upload all files and folders from this ZIP, preserving the structure.
3. In GitHub, open **Actions** → **IBOY CLOUD PC - Windows Automation**.
4. Select **Run workflow** → branch `main` → **Run workflow**.
5. Open the run and inspect the steps.
6. Download `iboy-cloud-pc-report` from the Artifacts section.

No GitHub Secrets are required for the included workflow. Do not add personal access tokens, Tailscale auth keys, passwords, or other secrets to source files.

## Termux upload option
After extracting the ZIP in Termux, you can use Git if installed:
```bash
pkg update
pkg install git
cd ~/IBOY-CLOUD-PC
git init
git branch -M main
git add .
git commit -m "Initial IBOY CLOUD PC source"
git remote add origin https://github.com/USERNAME/IBOY-CLOUD-PC.git
git push -u origin main
```
Replace `USERNAME` with your GitHub username. GitHub may require browser authentication or a token for Git operations; never paste a token into a public command or commit it into the repository. You can also upload the ZIP contents through GitHub's web interface without Termux.

## What this workflow does and does not do
**Does:** run PowerShell on `windows-2025`, apply per-user desktop preferences to the temporary runner account, validate scripts, and save a diagnostic artifact.

**Does not:** create an interactive Windows desktop session for Windows App, expose RDP, install a remote-access tunnel, preserve files after the runner is destroyed, or bypass GitHub job limits. The desktop settings affect the runner account only and are not a desktop you can sign into from your phone.

For supported interactive remote desktop access, use a Windows VM/VPS provider that explicitly permits RDP and follow its licensing and security requirements. This project intentionally does not turn a GitHub Actions runner into an RDP host.
