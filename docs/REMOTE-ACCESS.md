# Remote access boundary

This project intentionally does not provide RDP access to GitHub-hosted runners.

A GitHub-hosted runner is a temporary CI execution environment. The included workflow does not:
- enable Remote Desktop;
- open inbound firewall ports;
- install or authenticate a remote-access tunnel;
- publish a runner address or credentials;
- keep a runner alive after the job.

For interactive Windows App use, provision a Windows VM/VPS from a provider whose terms permit interactive remote desktop, configure a supported Windows edition/license, use strong authentication, and restrict RDP to a private network such as an appropriately configured Tailscale tailnet.
