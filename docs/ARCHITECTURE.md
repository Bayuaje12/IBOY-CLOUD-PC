# Architecture

- Compute: GitHub-hosted `windows-2025` runner.
- Orchestration: GitHub Actions workflow.
- Automation: Windows PowerShell.
- Desktop settings: current runner user's HKCU registry and profile.
- Output: workflow log plus downloadable report artifact.

The runner is ephemeral. It is provisioned for a job and discarded afterward. The workflow must not be treated as a persistent PC or an RDP host. Tailscale and remote-access scripts are safety/documentation stubs and do not establish a connection.
