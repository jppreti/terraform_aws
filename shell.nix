{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="ops-environment";
  buildInputs = [
    pkgs.git
    pkgs.micro
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
