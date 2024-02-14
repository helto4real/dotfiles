# Dotfiles
This is my ansible based dotfile installer :)
Install with :

Copy the vault password file:
```bash
scp vault-secret username@ip:~/.dotfiles/
```

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/helto4real/dotfiles/main/bin/dotfiles)"
```
# Ecrypt and decrypt values

To encrypt use `ansible-vault encrypt_string --vault-password-file vault-password.txt "<the string to encrypt>" --name '<varname>'"`
Then copy the output to `/group_vars/all.yaml`

To decrypt the string use:
`ansible localhost -m debug -a var="<var name>" -e "@group_vars/all.yml" --vault-id dev@vault-password.txt`
