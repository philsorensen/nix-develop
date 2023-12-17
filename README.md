# Nix Environments for Testing

This repository contains configurations for various 'nix develop' environments
for development and testing of configuration files and non-Nix codes.

> [!IMPORTANT]
> The **flake.lock** file is only updated on codes changes.  You will need to
> run `nix flake update` to update the file before activativing an environment.

## Environments

### Emacs

The environment sets up the pgtk version of emacs fetched from 
`nixpkgs-unstable` for the stable version and `nix-community/emacs-overlay`.  
The shell creates an alias `emacs` the loads configuration from
`~/Sources/dotemacs`.

  - `.#emacs-stable`
  - `.#emacs-unstable`
  - `.#emacs-master`

