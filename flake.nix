{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

 outputs = { self, nixpkgs }:
  {
    templates = {
			default = {
				path = ./templates/default;
				description = "Default template or know as everything template";
			};
			desktop = {
				path = ./templates/desktop;
				description = "Desktop template";
			};
		};
  };
}
