{ pkgs, ... }:

{
	home.packages = with pkgs; [
		bat
		bat-extras.batman
		bat-extras.batgrep
		bat-extras.batdiff
	];
	xdg.configFile."bat/" = {
		source = ../src/bat;
		recursive = true;
	};
}

