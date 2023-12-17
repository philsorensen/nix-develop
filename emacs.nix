/*
Setup Emacs configuration development environments.

The shell creates an emacs for using the configuration path in
environment variable DOTEMACS.  This is set to ~/Sources/dotemacs by
default.
*/

{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  pkgs-emacs = inputs.emacs-overlay.packages.${system};

  emacs-shell = emacs-pkg:
    pkgs.mkShellNoCC {
      name = emacs-pkg.name;

      packages = [
        pkgs.glibcLocalesUtf8
        emacs-pkg
      ];

      shellHook = ''
        export DOTEMACS="$HOME/Sources/dotemacs"

        alias emacs="emacs --init-directory=\$DOTEMACS --debug-init"
      '';
    };

in {
  emacs-stable = emacs-shell pkgs.emacs29-pgtk;
  emacs-unstable = emacs-shell pkgs-emacs.emacs-unstable-pgtk;
  emacs-master = emacs-shell pkgs-emacs.emacs-pgtk;
}
