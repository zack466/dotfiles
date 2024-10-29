{ pkgs, ... }: {
   programs.home-manager.enable = true;

   home.packages = [
    pkgs.cowsay;
    pkgs.git;
  ];

  programs.git = {
    enable = true;
  };
}
