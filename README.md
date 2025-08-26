# Telegram Live Streaming with FFmpeg

[![Build](https://img.shields.io/github/actions/workflow/status/Rockey800/test/rdp.yml?label=Build&logo=github)](https://github.com/Rockey800/test/actions)
[![Last Commit](https://img.shields.io/github/last-commit/Rockey800/test?color=blue&logo=git)](https://github.com/Rockey800/test/commits)
[![Repo Size](https://img.shields.io/github/repo-size/Rockey800/test?color=green)](https://github.com/Rockey800/test)
[![License](https://img.shields.io/github/license/Rockey800/test?color=orange)](./LICENSE)
[![Stars](https://img.shields.io/github/stars/Rockey800/test?style=social)](https://github.com/Rockey800/test/stargazers)
[![Forks](https://img.shields.io/github/forks/Rockey800/test?style=social)](https://github.com/Rockey800/test/network/members)
![Technology](https://img.shields.io/badge/Tech-FFmpeg-red)
![Platform](https://img.shields.io/badge/Platform-Telegram-green)
![Fair Use](https://img.shields.io/badge/Fair%20Use-Yes-blue)

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Resource Usage & Credits](#resource-usage--credits)
- [Logging Policy](#logging-policy)
- [Security & Disclaimer](#security--disclaimer)
- [GitHub Guidelines & Account Safety](#github-guidelines--account-safety)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Compliance & Account Suspension](#compliance--account-suspension)
- [GitHub Actions Usage Limits](#github-actions-usage-limits)
- [License](#license)

---

## Overview

This repository provides scripts and instructions for streaming live video to Telegram channels or groups using FFmpeg, replacing the previous Ngrok RDP setup.  

It allows high-quality live streaming from any compatible Windows or Linux environment while giving full control over network buffering, reconnect behavior, resolution, and bitrate.

---

## Features

- Stream live video directly to Telegram using FFmpeg  
- Supports HLS, TS, or MP4 input streams  
- Configurable network buffering and reconnect options  
- Compatible with GitHub-hosted runners or personal servers  
- Manual workflow trigger for controlled execution  

---

## Usage

1. Prepare your video source (URL, local file, or stream).  
2. Obtain your Telegram Bot token and chat ID.  
3. Run FFmpeg with a command similar to:

```bash
ffmpeg -re -i <input_source> -c:v copy -c:a copy -f mpegts "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendVideo?chat_id=<CHAT_ID>&stream=true"
## Resource Usage & Credits

- Uses FFmpeg for video processing and Telegram streaming  
- Works on GitHub-hosted runners or personal servers  
- Designed for personal, educational, and fair use only  
- Thanks to Telegram and FFmpeg for providing free, open tools  

---

## Logging Policy

- No sensitive information (Bot tokens, chat IDs, API keys) is printed or logged  
- Logs include minimal information for workflow status, FFmpeg progress, and debugging  
- Monitored to ensure no abusive or unauthorized streaming  
- Complies fully with GitHub and Telegram Terms of Service  

---

## Security & Disclaimer

- Intended solely for personal, educational, and experimental use  
- Do not use for illegal, malicious, or abusive activities  
- Keep Bot tokens and chat IDs secure  
- The author is not responsible for misuse  

---

## GitHub Guidelines & Account Safety

- Use GitHub Actions responsibly and within free-tier limits  
- Enable 2FA and keep credentials safe  
- Avoid abusive or spammy behavior  
- Keep workflows limited to allowed tasks and streaming only  

---

## Contributing

- Fork the repository and create your branch from `main`  
- Make changes with clear, descriptive commit messages  
- Test thoroughly before submitting  
- Open a Pull Request describing what you changed and why  

**Guidelines:**

- Keep code, workflows, and documentation clean and consistent  
- Follow FFmpeg and GitHub Actions best practices  
- Respect educational/personal usage limits  
- Never include Telegram Bot tokens or chat IDs  

---

## Code of Conduct

- Foster a harassment-free, welcoming environment  
- Use inclusive language and respect differing viewpoints  
- Accept constructive feedback gracefully  
- Show empathy and focus on community well-being  
- Report violations to the project maintainer via email  

---

## Compliance & Account Suspension

**Common Reasons for Suspension:**

- Violating GitHub Terms of Service  
- Spam, abusive behavior, or harassment  
- Resource abuse beyond fair use  
- Publishing secrets or private data  
- Security violations or malware  
- Copyright infringement  
- Impersonation or fraud  

**Best Practices:**

- Ethical use only: educational/personal streaming  
- Limit workflow runtime to 5 hours  
- Secure Bot tokens with GitHub Secrets  
- No malicious code or resource abuse  
- Follow GitHub and Telegram Terms of Service  

---

## GitHub Actions Usage Limits

- Maximum job runtime: 6 hours per job  
- Telegram streaming workflow configured for 5 hours  
- Stay within free-tier limits to avoid automatic termination  

More info: [GitHub Actions Usage Limits](https://docs.github.com/en/actions/learn-github-actions/usage-limits-billing-and-administration)  

---

## License

MIT License

