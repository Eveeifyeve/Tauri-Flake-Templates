{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = {
        lib,
        pkgs,
        system,
        config,
        ...
      }: 
      {
        devShells.default = pkgs.mkShell
        {
					buildInputs = with pkgs; [
    				libiconv

						# Rust
						cargo 
						rustc
						rustfmt

						# Node.js
						nodejs # feel free to change the version
						npm

						# Android tooling 
						android-tools
  				]	++ ib.optionals stdenv.isLinux (with pkgs; [ gtk3 libsoup_3 webkitgtk_4_1 android-studio ] ) ++
					(with pkgs; [
					darwin.libobjc
					darwin.xcode
					darwin.apple_sdk.frameworks.AppKit
					darwin.apple_sdk.frameworks.UiKit
					darwin.apple_sdk.frameworks.WebKit
					darwin.apple_sdk.frameworks.SystemConfiguration
					darwin.apple_sdk.frameworks.CoreSevices
					darwin.apple_sdk.frameworks.Security
					]);
        };
      };
    };
}
