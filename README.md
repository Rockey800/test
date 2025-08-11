# Windows RDP Setup with Ngrok

![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Rockey800/test/windows-rdp-ngrok.yml?branch=main&label=workflow)

---

## Overview

This repository provides PowerShell scripts to automate the setup of a Windows Remote Desktop (RDP) environment with ngrok tunneling, enabling secure remote access on GitHub-hosted Windows runners.

---

## Features

- Automated Windows RDP setup using PowerShell  
- Secure ngrok tunnel integration for external connectivity  
- Leverages GitHub-hosted runners with 16GB RAM and 4 CPU cores  
- Manual workflow trigger for controlled execution  

---

## Usage

1. **Trigger the workflow manually** via GitHub Actions.  
2. **Provide your ngrok authentication token** securely using [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) or workflow inputs.  
3. The workflow runs for a limited session duration (default 5 hours) to comply with GitHub’s resource policies.

---
## Resource Usage & Credits

- This project utilizes [ngrok](https://ngrok.com/) to provide secure tunneling for remote desktop access.
- It runs on GitHub-hosted Windows runners, which are free virtual machines provided by GitHub for open-source and personal projects.
- We use these services within their free tier limits and comply with their respective Terms of Service.
- This project is strictly for personal, educational, and ethical use, and does not violate any service policies.

Thanks to GitHub and ngrok for providing these invaluable free tools!

## Security & Disclaimer

- This project is intended **solely for personal and educational use**.  
- Do **not** use this workflow for any malicious, illegal, or abusive activities.  
- Always store sensitive tokens securely and avoid exposing them in logs or repository files.  
- The author is not liable for any misuse of this repository.

---

## License

This project is licensed under the [MIT License](./LICENSE).

---

## Support

For questions or issues, please open an issue in this repository.

---

Thank you for using this project responsibly!
