Table of Contents

Overview

Features

Usage

Resource Usage & Credits

Security & Disclaimer

Logging Policy

License

Support

📚 Documentation & Policies

Overview

This repository provides scripts and instructions for streaming live video to Telegram channels or groups using FFmpeg, enabling smooth and configurable live streaming from any compatible server or RDP environment.

Features

Stream live video directly to Telegram using FFmpeg

Support for HLS, TS, or MP4 input streams

Configurable network buffering, reconnect delay, resolution, and bitrate

Compatible with GitHub-hosted runners or personal Windows/Linux machines

Manual workflow trigger for controlled execution

Usage

Prepare your video source (URL, file, or stream).

Obtain your Telegram Bot token and chat ID.

Run FFmpeg with the appropriate command to stream:

ffmpeg -re -i <input_source> -c:v copy -c:a copy -f mpegts "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendVideo?chat_id=<CHAT_ID>&stream=true"


Adjust optional parameters as needed:

-bufsize for network buffer

-reconnect 1 -reconnect_delay_max 2 for automatic reconnections

-vf scale=1920:1080 for resolution

Test your stream before going live to ensure audio/video sync and proper connection.

Resource Usage & Credits

This project leverages FFmpeg for efficient video processing and streaming.

Works on any machine with sufficient bandwidth and compute resources (e.g., GitHub-hosted runners or personal servers).

Use responsibly within Telegram’s live streaming limits and your server’s capacity.

Thanks to Telegram and FFmpeg for providing these open, free, and powerful tools!

Security & Disclaimer

This project is intended solely for personal and educational use.

Do not use this workflow for illegal, abusive, or copyright-infringing activities.

Keep sensitive tokens secure; avoid exposing them in logs or repository files.

The author is not liable for any misuse.

Logging Policy

See LOGGING_POLICY.md
 for responsible logging practices and privacy considerations.

License

This project is licensed under the MIT License
.

Support

For questions or issues, please open an issue in this repository.

📚 Documentation & Policies

This repository includes detailed documentation to ensure transparency and compliance:

CONTRIBUTING.md
 — Guidelines for contributing

CODE_OF_CONDUCT.md
 — Community standards

SECURITY.md
 — Reporting security issues

SUPPORT.md
 — Help or problem reporting

RESOURCE_USAGE.md
 — Guidance on resources and streaming

FFMPEG_USAGE.md
 — FFmpeg command examples and options

GITHUB_USAGE_GUIDELINES.md
 — GitHub compliance

DISCLAIMER.md
 — Legal disclaimers and liability

USAGE_LIMITS.md
 — Workflow runtime limits

✅ This ensures clarity, professionalism, and responsible use of Telegram live streaming resources.
