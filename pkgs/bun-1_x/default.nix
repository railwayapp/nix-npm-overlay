# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "bun";
  version = "1.0.0";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/bun/-/bun-1.0.0.tgz";
    sha512 = "LNqtzM5lg/dHfwORsOEqMNFQUIiYA+txJ8uBUjrgDCHzOPjOzpMQt4ifLEDGj50498WiCXiTdGZfC/BsTa6Pmg==";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    chmod +x $out/bin/{bun,bunx}
  '';
}