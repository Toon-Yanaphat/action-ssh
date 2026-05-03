# action-ssh

A simple GitHub Action for running commands on a remote server via SSH.  
Useful for deployment, remote automation, or running scripts on your servers directly from your CI/CD workflow.

## Usage

Add this step to your workflow:

```yaml
- name: Run commands on remote server via SSH
  uses: Toon-Yanaphat/action-ssh@main
  with:
    host: ${{ secrets.SSH_HOST }}
    user: ${{ secrets.SSH_USER }}
    key:  ${{ secrets.SSH_KEY }}
    script: |
      echo "Hello from remote server!"
      # Add any commands you need here
```

## Inputs

| Name   | Description                          | Required |
|--------|--------------------------------------|----------|
| host   | Hostname or IP address of the server | Yes      |
| user   | SSH username                        | Yes      |
| key    | SSH private key (PEM format)        | Yes      |
| script | Shell script or command to execute  | Yes      |

> :warning: It is recommended to store `host`, `user`, and `key` as GitHub Secrets for security.

## Setting up GitHub Secrets

1. Go to your repository’s **Settings > Secrets**.
2. Add the following secrets:
   - `SSH_HOST` – your server’s IP or hostname
   - `SSH_USER` – your SSH username
   - `SSH_KEY` – your private key (the entire contents, PEM format)

## Notes

- The action saves your private key to `key.pem` and sets permission to 600.
- `StrictHostKeyChecking` is disabled for convenience (suitable for automation).
- Make sure the corresponding public key is in the server’s `authorized_keys`.
