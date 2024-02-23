# Dotfiles
This is my ansible based dotfile installer :)
Install with :

Create a password file named `vault.secret` in the base directore. Do not worry, it is excluded in `.gitignore`
Copy the vault password file by:
```bash
# Create the remote directory 
ssh username@ip mkdir ~/.ansible-vault
# Copy the file to the correct place
scp vault.secret username@ip:~/.ansible-vault/vault.secret
```

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/helto4real/dotfiles/main/bin/dotfiles)"
```
Make sure you are sudo before running any command locally or using the `dotfiles` upgrade script

# Ecrypt and decrypt values

To encrypt use `ansible-vault encrypt_string --vault-password-file vault-password.txt "<the string to encrypt>" --name '<varname>'"`
Then copy the output to `/group_vars/all.yaml`

To decrypt the string use:
`ansible localhost -m debug -a var="<var name>" -e "@group_vars/all.yml" --vault-id dev@vault-password.txt`

## Debugging
To debug ansible playbooks, just set the env var to `export ANSIBLE_ENABLE_TASK_DEBUGGER=True`

To run a specific role locally during development edit the `main_test.yml` and run
```shell
ansible-playbook main_test.yml --vault-password-file vault.secret
```
## After installation
Reboot after successful installation.

### Tmux
Install the plugins with `<prefix>-I`

### Nvim
If you want to edit config directly locally on this gitrepo, make a symbolic link and you do not need ot push the changes.
```bash
unlink ~/.config/nvim
ln -s ~/git/dotfiles/roles/neovim/files ~/.config/nvim
```

### Copilot
To use copilot plugin you need to setup.

```
:Copilot setup
```
Hepp!

### Noteworthy cool stuff

- `rvim -s <server> -d <directory>` to remote nvim to a server
- `bt` to use top command on sterioids
- `k9s` to view kubernetes cluster in command window
- `z` to do smart cd using keyword, single z alwas go to home directory

## Attribution
Big thanks to `@TechDufus` for sharing his work.
https://github.com/TechDufus/dotfiles

