{

  inputs = { };

  outputs = inputs:
    let
      pkgs = inputs.self.packages.x86_64-linux;
      lib = {
        mkDerivation = { name, buildInputs, env }:
          derivation ({
            name = name;
            system = "x86_64-linux";
            builder = ./builder.sh;
            buildInputs = buildInputs;
          } // env);
      };
    in
    {
      packages = {
        x86_64-linux = {
          default = lib.mkDerivation {
            name = "dulli";
            buildInputs = with pkgs; [ busybox ];
            env = { person = "Felix"; };
          };
          busybox = derivation
            {
              name = "busybox";
              system = "x86_64-linux";
              builder = ./busybox.sh;
              busybox = (import <nix/fetchurl.nix>) {
                url = https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox;
                sha256 = "sha256-mVOoYPn3r9NYiZjQf5AF2p7hXy1Q4kN5RSscc/PGpiY=";
                executable = true;
              };
              cp = (import <nix/fetchurl.nix>) {
                url = https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_CP;
                sha256 = "sha256-SohMSgXijkdN8Y7LE522obQ0QUAs8xBEQl+p0w8iAVc=";
                executable = true;
              };

            };
        };
      };
    };
}
