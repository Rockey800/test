# GitHub Actions Usage Limits

## Maximum Job Runtime

GitHub Actions jobs have a maximum runtime limit of **6 hours (360 minutes)** per job.  
If a job exceeds this limit, it will be automatically terminated.

## How This Project Complies

- The Windows RDP workflow is intentionally configured to run for **5 hours (18000 seconds)**,  
  staying safely within the 6-hour maximum allowed by GitHub.

- This ensures uninterrupted sessions while respecting GitHub’s resource usage policies.

## Additional Notes

- GitHub provides free minutes and resources for public repositories; please monitor your usage to avoid exceeding limits.

- For more details, see GitHub’s official documentation:  
  https://docs.github.com/en/actions/learn-github-actions/usage-limits-billing-and-administration#usage-limits

---

By following these limits, this project remains compliant with GitHub’s Terms of Service and fair use policies.
