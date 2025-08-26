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


Overview

This repository provides scripts and instructions for streaming live video to Telegram channels or groups using FFmpeg, replacing the previous Ngrok RDP setup. It enables high-quality live streaming from any compatible Windows or Linux environment while giving you full control over network buffering, reconnect behavior, resolution, and bitrate.

Features

Stream live video directly to Telegram using FFmpeg

Supports HLS, TS, or MP4 input streams

Configurable network buffering and reconnect options

Works on GitHub-hosted runners or personal servers

Manual workflow trigger for controlled execution

Usage

Prepare your video source (URL, local file, or stream).

Obtain your Telegram Bot token and chat ID.

Run FFmpeg with a command similar to:

ffmpeg -re -i <input_source> -c:v copy -c:a copy -f mpegts "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendVideo?chat_id=<CHAT_ID>&stream=true"


Optional parameters:

-bufsize → Adjust network buffering

-reconnect 1 -reconnect_delay_max 2 → Automatic reconnect

-vf scale=1920:1080 → Set resolution

Test your stream to ensure audio/video sync and stable connectivity.

Resource Usage & Credits

Uses FFmpeg for video processing and Telegram streaming.

Compatible with GitHub-hosted runners or personal servers.

Designed for personal, educational, and fair use only.

Thanks to Telegram and FFmpeg for their free and open tools, which make this project possible.

Security & Disclaimer

Intended solely for personal and educational purposes.

Do not use this workflow for illegal, malicious, or abusive activities.

Keep bot tokens and chat IDs secure.

The author is not responsible for misuse of this repository.

Logging Policy

See LOGGING_POLICY.md
 for details on how logs are handled responsibly.

License

This project is licensed under the MIT License
.

Support

For questions or issues, please open an issue in this repository.

Request for Understanding and Contact

We maintain this repository in good faith for educational and personal streaming purposes. Mistakes during use or configuration are unintentional. Open communication is welcomed through GitHub issues or profiles. We strive to comply with all policies and hope minor errors are addressed with understanding rather than immediate action.

Supporting the Community

By responsibly using and sharing FFmpeg and Telegram, we contribute to the open-source ecosystem, helping others learn streaming techniques while promoting ethical and fair usage.

📚 Documentation & Policies

This repository includes comprehensive documentation:

CONTRIBUTING.md
 — Guidelines for contributors

CODE_OF_CONDUCT.md
 — Community standards

SECURITY.md
 — Security issue reporting

SUPPORT.md
 — Help and support

RESOURCE_USAGE.md
 — Guidelines for server/stream usage

FFMPEG_USAGE.md
 — FFmpeg commands and options

GITHUB_USAGE_GUIDELINES.md
 — GitHub workflow compliance

DISCLAIMER.md
 — Legal disclaimers and liabilities

USAGE_LIMITS.md
 — Workflow runtime limits

✅ This ensures the same professional structure, headings, badges, and tone as your original Ngrok README but fully adapted for Telegram live streaming using FFmpeg.
