## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Usage](#usage)  
- [Resource Usage & Credits](#resource-usage--credits)  
- [Security & Disclaimer](#security--disclaimer)  
- [Logging Policy](#logging-policy)  
- [License](#license)  
- [Support](#support)  
- [Request for Understanding and Contact](#request-for-understanding-and-contact)  
- [Supporting the Community](#supporting-the-community)  
- [📚 Documentation & Policies](#-documentation--policies)



# Telegram Live Streaming with FFmpeg

[![Build](https://img.shields.io/github/actions/workflow/status/Rockey800/test/rdp.yml?label=Build&logo=github)](https://github.com/Rockey800/test/actions)  
[![Last Commit](https://img.shields.io/github/last-commit/Rockey800/test?color=blue&logo=git)](https://github.com/Rockey800/test/commits)  
[![Repo Size](https://img.shields.io/github/repo-size/Rockey800/test?color=green)](https://github.com/Rockey800/test)  
[![License](https://img.shields.io/github/license/Rockey800/test?color=orange)](https://github.com/Rockey800/test/blob/main/LICENSE)  
[![Stars](https://img.shields.io/github/stars/Rockey800/test?style=social)](https://github.com/Rockey800/test/stargazers)  
[![Forks](https://img.shields.io/github/forks/Rockey800/test?style=social)](https://github.com/Rockey800/test/network/members)  
![FFmpeg](https://img.shields.io/badge/Tech-FFmpeg-blue?logo=ffmpeg)  
![Telegram Live](https://img.shields.io/badge/Powered%20by-Telegram-red?logo=telegram)  
![Fair Use](https://img.shields.io/badge/Fair%20Use-Yes-green)  

---

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Usage](#usage)  
- [Resource Usage & Credits](#resource-usage--credits)  
- [Security & Disclaimer](#security--disclaimer)  
- [Logging Policy](#logging-policy)  
- [License](#license)  
- [Support](#support)  
- [Request for Understanding and Contact](#request-for-understanding-and-contact)  
- [Supporting the Community](#supporting-the-community)  
- [📚 Documentation & Policies](#-documentation--policies)

---

## Overview

This repository provides scripts and instructions for streaming live video to **Telegram channels or groups** using **FFmpeg**, replacing the previous Ngrok RDP setup.  
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

1. Prepare your **video source** (URL, local file, or stream).  
2. Obtain your **Telegram Bot token** and **chat ID**.  
3. Run FFmpeg with a command similar to:

```bash
ffmpeg -re -i <input_source> -c:v copy -c:a copy -f mpegts "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendVideo?chat_id=<CHAT_ID>&stream=true"
## Resource Usage & Credits

- Uses FFmpeg for video processing and Telegram streaming  
- Works on GitHub-hosted runners or personal servers  
- Designed for personal, educational, and fair use only  
- Thanks to Telegram and FFmpeg for providing free, open tools that make this project possible  

## Security & Disclaimer

- Intended solely for personal and educational purposes  
- Do not use this workflow for illegal, malicious, or abusive activities  
- Keep bot tokens and chat IDs secure  
- The author is not responsible for misuse of this repository  

## Logging Policy

- See [LOGGING_POLICY.md](./LOGGING_POLICY.md) for details on responsible logging practices and privacy considerations  

## License

- This project is licensed under the [MIT License](./LICENSE.txt)  

## Support

- For questions or issues, please open an issue in this repository  

## Request for Understanding and Contact

- We maintain this repository in good faith for educational and personal streaming purposes  
- Mistakes during use or configuration are unintentional  
- Open communication is welcomed through GitHub issues or profiles  
- We strive to comply with all policies and hope minor errors are addressed with understanding rather than immediate action  

## Supporting the Community

- By responsibly using and sharing FFmpeg and Telegram, we contribute to the open-source ecosystem  
- Helps others learn streaming techniques while promoting ethical and fair usage  

## 📚 Documentation & Policies

- [CONTRIBUTING.md](./CONTRIBUTING.md) — Guidelines for contributors  
- [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) — Community standards  
- [SECURITY.md](./SECURITY.md) — Security issue reporting  
- [SUPPORT.md](./SUPPORT.md) — Help and support  
- [RESOURCE_USAGE.md](./RESOURCE_USAGE.md) — Guidelines for server/stream usage  
- [FFMPEG_USAGE.md](./FFMPEG_USAGE.md) — FFmpeg commands and options  
- [GITHUB_USAGE_GUIDELINES.md](./GITHUB_USAGE_GUIDELINES.md) — GitHub workflow compliance  
- [DISCLAIMER.md](./DISCLAIMER.md) — Legal disclaimers and liabilities  
- [USAGE_LIMITS.md](./USAGE_LIMITS.md) — Workflow runtime limits  

✅ This README keeps the same professional structure, headings, badges, clickable Table of Contents, and tone as your original Ngrok README, now fully adapted for Telegram live streaming using FFmpeg.
