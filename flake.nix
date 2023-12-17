{
  description = "Flake for Nnix testing environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    emacs-overlay.url = "github:nix-community/emacs-overlay/master";
  };

  nixConfig = {
    extra-substituters = [
      https://nix-community.cachix.org
    ];
    extra-trusted-public-keys = [
      nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
    ];
  };

  outputs = {
    self,
    nixpkgs,
    emacs-overlay
  } @ inputs: let
    system = "x86_64-linux";

  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    devShells.${system} = import ./emacs.nix {inherit inputs system;};
  };
}
