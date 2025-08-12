# Security Policy

## Supported Versions
This project is actively maintained. Security updates will be applied to the latest release.

| Version | Supported          |
| ------- | ------------------ |
| main    | ✅                  |
| older   | ❌                  |

---

## Reporting a Vulnerability
If you discover a security vulnerability in this project, **please report it privately** so we can address it quickly.

- **Email:** your-email@example.com  
- **Subject:** Security Report – [Project Name]  

When reporting, include:
1. Detailed description of the vulnerability.
2. Steps to reproduce (if applicable).
3. Potential impact and severity.
4. Any suggested fixes or mitigations.

**Please do not** disclose vulnerabilities publicly until they have been fixed.

---

## Security Best Practices for Users
Because this project sets up a Windows RDP session via GitHub Actions and ngrok:

- **Use your own ngrok authtoken** — never share it publicly.
- Always enable **`--auth`** in ngrok to password-protect tunnels.
- Use **random RDP credentials** instead of fixed passwords.
- Never use this environment for illegal or malicious activities.
- Avoid storing sensitive data in the temporary RDP session — it is not persistent and may be logged.
- Limit usage to **maximum 5 hours** per session (auto-shutdown is recommended).
- Do not install untrusted or unsafe software inside the RDP session.

---

## Handling Security Reports
- We will acknowledge your report within **48 hours**.
- Fixes for confirmed vulnerabilities will be released within **7 days**, unless more time is needed.
- You will be credited in the security advisory unless you prefer to remain anonymous.

---

## Responsible Disclosure
We follow the principles of [Responsible Disclosure](https://en.wikipedia.org/wiki/Responsible_disclosure):
- Report privately.
- Allow reasonable time for fixes.
- Avoid exploiting the vulnerability before it is patched.

---

## Additional Notes
This project relies on:
- **GitHub Actions** — bound by [GitHub’s Acceptable Use Policies](https://docs.github.com/en/site-policy/acceptable-use-policies)
- **ngrok** — bound by [ngrok’s Terms of Service](https://ngrok.com/tos)

Any violation of these terms may lead to suspension of your GitHub or ngrok account.

---
