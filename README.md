# Dotfiles and system config

## From a fresh install

+ Install git
+ Clone this repo
+ Run `setup.sh`

## Configuring iTerm

+ Launch iTerm
+ Profiles > Text > Font: Change font to 12 pt Meslo for Powerline
+ General > Preferences: Check "Load pref from custom folder", add the `dotfiles/assets` folder.

## Setting up the GPG keychain

If using a yubikey, you'll need to import the public keys into your gpg keychain:

```bash
$ gpg --card-edit
> fetch
> quit
```

