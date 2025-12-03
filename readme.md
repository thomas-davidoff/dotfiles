# .files

## Basic setup

### 1. Install Homebrew and bundled casks/brews

Install homebrew via [instructions on Homebrew's homepage](https://brew.sh/)

```sh
# probably doesn't actually need bash but whatever. Not gonna check.

# if you want to inspect it first:
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | less

# do the install
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
```

You should run `brew install git` too at this point, just so you can clone this repo
with the non-system apple git version.

### 2. Clone this repo

Clone and cd into this repo. Note that the rest of this guide assumes you're
cloning the repo into ~/dotfiles.

```sh
git clone git@github.com:thomas-davidoff/dotfiles.git
cd dotfiles
```

### 3. Install homebrews

Run `brew bundle install --file homebrew/Brewfile` to install all the things
(see `man brew` for info on `brew bundle usage`).

Note that you can drop `-f homebrew/Brewfile` later on as `HOMEBREW_BUNDLE_FILE`
will be made available in the environment, and will point to `~/dotfiles/homebrew/Brewfile`:

```sh
# can run this alone later, when you want to update stuff
brew bundle
```

If you want to do a cleanup (if this ain't your first time installing things
with brew and want to get rid of anything else hanging around).

```sh
brew bundle cleanup --file homebrew/Brewfile
# then, if all looks ok
brew bundle cleanup -f --file homebrew/Brewfile
```

### 4. Stow this config

[Stow](https://github.com/aspiers/stow) is basically just a symlink QoL tool.

If you already have customizations in your config files, make a back up of them.
With `stow` installed, you can simply run `stow homebrew kitty nvim zsh`.

Voila. Now you have symlinked config files:

```sh
ls -l ~/.zshrc
lrwxr-xr-x@ 1 schleeb  staff  19 Jun  9 23:31 /Users/schleeb/.zshrc -> dotfiles/zsh/.zshrc
```


### 5. Open kitty

When you open Kitty, you should be pretty much completely good to go. You may
see a warning from p10k telling you that it detected console output during
initialization. This is likely because you don't have extra things installed
like uv for Python management. See below.

## Additional setup

### Install uv for Python management

Pyenv is great, but it doesn't do everything. `uv` isn't really my choice for
managing Python itself, but it's a great tool that *can* do it, so:

See [uv docs](https://docs.astral.sh/uv/getting-started/installation/) for
proper docs on installing uv.

In short:

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Ensure `"$HOME/.local/bin"` is prepended to path. `uv` may edit your config
against your will, which is annoying. Note that when using the `.zprofile` config
from this repo, it is prepended, so you don't need to do anything here.

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
