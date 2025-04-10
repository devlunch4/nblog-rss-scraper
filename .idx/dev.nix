{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
    pkgs.nodePackages.http-server
  ];
  env = {};

  idx = {
    extensions = [];
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["http-server" "." "-p" "$PORT"];
          manager = "web";
          env = {
            PORT = "$PORT";
          };
        };
      };
    };
    workspace = {
      onCreate = {
        default.openFiles = [ ".idx/dev.nix" "README.md" "index.html" ];
      };
      onStart = { };
    };
  };
}
