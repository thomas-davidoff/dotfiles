# .files

## Additional steps

### Install uv for Python management

See [uv docs](https://docs.astral.sh/uv/getting-started/installation/) for
proper docs on installing uv.

In short:

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Ensure `"$HOME/.local/bin"` is prepended to path. `uv` may edit your config
against your will, which is annoying.

### Git Signing

Follow [this gist](https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e)
to configure git signing. `gnupg` and `pinentry-mac` are already installed via
the Brewfile.

*Summary*:

```sh
# install things from Brewfile incl pinentry-mac and gnupg
brew bundle

# create gpg dir
mkdir -p ~/.gnupg

# Tells GPG which pinentry program to use
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

# update gpg config
# This tells gpg to use the gpg-agent
echo 'use-agent' > ~/.gnupg/gpg.conf

# update perms on gpg config
chmod 700 ~/.gnupg

# kill agent - let restart
killall gpg-agent

# create key
gpg --full-gen-key

## answer questions

# copy key id to prepare for next step (copy val after rsa..../)
gpg -K --keyid-format SHORT

# export public key to add to gh
gpg --armor --export <key id>

# configure git
git config --global gpg.program $(which gpg)
git config --global user.signingkey <key id>
git config --global commit.gpgsign true
```
