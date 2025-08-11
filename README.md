# Windows RDP Setup with Ngrok

![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Rockey800/test/windows-rdp-ngrok.yml?branch=main&label=workflow)

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Usage](#usage)  
- [Resource Usage & Credits](#resource-usage--credits)  
- [Security & Disclaimer](#security--disclaimer)  
- [License](#license)  
- [Support](#support)  
- [📚 Documentation & Policies](#-documentation--policies)

## Overview

This repository provides PowerShell scripts to automate the setup of a Windows Remote Desktop (RDP) environment with ngrok tunneling, enabling secure remote access on GitHub-hosted Windows runners.

## Features

- Automated Windows RDP setup using PowerShell  
- Secure ngrok tunnel integration for external connectivity  
- Leverages GitHub-hosted runners with 16GB RAM and 4 CPU cores  
- Manual workflow trigger for controlled execution

## Usage

- Trigger the workflow manually via GitHub Actions.  
- Provide your ngrok authentication token securely using GitHub Secrets or workflow inputs.  
- The workflow runs for a limited session duration (default 5 hours) to comply with GitHub’s resource policies.

## Resource Usage & Credits

- This project utilizes [ngrok](https://ngrok.com/) to provide secure tunneling for remote desktop access.  
- It runs on GitHub-hosted Windows runners, which are free virtual machines provided by GitHub for open-source and personal projects.  
- We use these services within their free tier limits and comply with their respective Terms of Service.  
- This project is strictly for personal, educational, and ethical use, and does not violate any service policies.  
- Thanks to GitHub and ngrok for providing these invaluable free tools!

## Security & Disclaimer

- This project is intended solely for personal and educational use.  
- Do not use this workflow for any malicious, illegal, or abusive activities.  
- Always store sensitive tokens securely and avoid exposing them in logs or repository files.  
- The author is not liable for any misuse of this repository.

## License

This project is licensed under the [MIT License](./LICENSE.txt).

## Support

For questions or issues, please open an issue in this repository.

## 📚 Documentation & Policies

This repository includes comprehensive documentation to ensure clarity, security, and community standards, including:

- [CONTRIBUTING.md](./CONTRIBUTING.md) — Guidelines for contributing to the project  
- [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) — Community behavior and standards  
- [SECURITY.md](./SECURITY.md) — How to report security issues responsibly  
- [SUPPORT.md](./SUPPORT.md) — How to get help or report problems  
- [RESOURCE_USAGE.md](./RESOURCE_USAGE.md) — Details on usage of GitHub-hosted runners and ngrok  
- [NGROK_USAGE.md](./NGROK_USAGE.md) — Information about ngrok integration and best practices  
- [POWERSHELL_USAGE.md](./POWERSHELL_USAGE.md) — Notes on PowerShell scripts used in this project  
- [GITHUB_USAGE_GUIDELINES.md](./GITHUB_USAGE_GUIDELINES.md) — GitHub policies and usage guidelines followed  
- [DISCLAIMER.md](./DISCLAIMER.md) — Important disclaimers about usage and liabilities  
- [USAGE_LIMITS.md](./USAGE_LIMITS.md) — GitHub Actions runtime limits and compliance  
- [LICENSE.txt](./LICENSE.txt) — Project licensing (MIT License)

This ensures transparency, professionalism, and responsible use of resources.

Thank you for using this project responsibly!
