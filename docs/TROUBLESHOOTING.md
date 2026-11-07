# Troubleshooting

## Workflow does not appear
Confirm `.github/workflows/iboy-cloud-pc.yml` is committed to the default branch and Actions are enabled for the repository.

## Wallpaper step fails
Confirm `assets/wallpaper.jpg` exists and is a valid JPG. Preserve the exact filename and path.

## PowerShell script fails
Open the failed workflow step, read the first error, and verify the repository structure. The workflow uses PowerShell 7-compatible syntax.

## No desktop appears in Windows App
This is expected. GitHub-hosted runners are CI workers, not supported interactive RDP desktops. The workflow only changes preferences in the runner's temporary user profile.

## Artifact missing
The report upload step uses `if: always()`. Check whether the workflow was cancelled before artifact upload could complete.
