![License](https://img.shields.io/badge/license-MIT-blue.svg)
# Windows RDP Setup with Ngrok

This repository provides PowerShell automation scripts to configure a Windows Remote Desktop (RDP) environment with secure ngrok tunneling for remote access on GitHub-hosted Windows runners.

---

## Features

- Fully automated Windows RDP setup using PowerShell  
- Secure ngrok tunnel integration for external connectivity  
- Designed to leverage GitHub-hosted runners with 16GB RAM and 4 CPU cores  
- Manual workflow trigger to ensure controlled execution  

---

## Usage Instructions

1. **Manual Trigger:**  
   Run the workflow manually via GitHub Actions to start the RDP and ngrok setup.

2. **Secure Token Handling:**  
   Supply your ngrok authentication token through [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) or workflow inputs.  
   **Never hardcode or expose secrets in your repository or logs.**

3. **Session Duration:**  
   The workflow is designed for limited-duration sessions (default 5 hours) to respect GitHub’s resource usage policies.

---

## Disclaimer & Ethical Use

This project is provided **strictly for personal and educational purposes**.  
Users must comply with all applicable laws, GitHub Terms of Service, and third-party service policies.  
**Any malicious, illegal, or abusive use is strictly prohibited.**  

The author disclaims any liability for misuse of this repository.

---

## Security Best Practices

- Use GitHub Secrets for all sensitive information.  
- Avoid printing tokens or credentials in workflow logs.  
- Regularly monitor workflow runs and usage to prevent abuse.

---

If you have questions or need assistance, feel free to open an issue or contact the author.

