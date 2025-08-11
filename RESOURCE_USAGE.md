# Resource Usage and Credits

## GitHub-Hosted Runners

This project runs on GitHub-hosted Windows runners, specifically the **windows-latest** environment, which provides:

- 16 GB RAM  
- 4 CPU cores  

These runners are provided free of cost by GitHub to support open-source, educational, and personal projects. We respect GitHub’s [Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) and use these resources responsibly within their intended limits.

## Ngrok Tunneling

To enable remote access, we use [ngrok](https://ngrok.com/) to create secure tunnels from the GitHub-hosted runner to external devices.

- Ngrok is used within its free tier for personal and educational purposes.
- The ngrok authentication token is stored securely via GitHub Secrets.
- Users must comply with ngrok’s [Terms of Service](https://ngrok.com/tos).

## Acknowledgments

Thanks to GitHub for providing generous free runner resources and to ngrok for their secure tunneling service, enabling this project’s functionality without extra cost.

---

By using these free services responsibly, we aim to provide a secure and efficient solution for remote Windows desktop access.
