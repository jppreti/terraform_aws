{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="ops-environment";
  buildInputs = [
    pkgs.git
    pkgs.micro
    pkgs.jq       # para filtrar arquivos json (ex.: jq .clima arquivo.json)
    pkgs.tmux     # multiplexador para gerenciar várias sessões de terminal
    pkgs.bat
    pkgs.openvscode-server
    pkgs.awscli
    pkgs.terraform
    pkgs.gnupg
  ];
  shellHook = ''
    echo "Ambiente pronto para GitOps ..."
  '';
}
