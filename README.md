# Dotfiles
This is my ansible based dotfile installer :)
Install with :

Create a password file named `vault.secret` in the base directore. Do not worry, it is excluded in `.gitignore`
Copy the vault password file by:
```bash
# Create the remote directory 
ssh username@ip mkdir ~/.ansible-vault
#c Copy the file to the correct place
scp vault.secret username@ip:~/.ansible-vault/vault.secret
```

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/helto4real/dotfiles/main/bin/dotfiles)"
```
# Ecrypt and decrypt values

To encrypt use `ansible-vault encrypt_string --vault-password-file vault-password.txt "<the string to encrypt>" --name '<varname>'"`
Then copy the output to `/group_vars/all.yaml`

To decrypt the string use:
`ansible localhost -m debug -a var="<var name>" -e "@group_vars/all.yml" --vault-id dev@vault-password.txt`

## Debugging
To debug ansible playbooks, just set the env var to `export ANSIBLE_ENABLE_TASK_DEBUGGER=True`

## After installation
Reboot after successful installation.

### Tmux
Install the plugins with `<prefix>-I`

### Noteworhy cool stuff

- `rvim -s <server> -d <directory>` to remote nvim to a server
- `bt` to use top command on sterioids
- `k9s` to view kubernetes cluster in command window

## Attribution
Big thanks to `@TechDufus` for sharing his work.
https://github.com/TechDufus/dotfiles

