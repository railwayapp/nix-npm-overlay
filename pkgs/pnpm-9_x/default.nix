# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "pnpm";
  version = "9.15.2";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/pnpm/-/pnpm-9.15.2.tgz";
    sha512 = "k+V7ASbw33TOa/8paAOUwLpU7Ecka5zzIfASHY2bsD91CnBfJO3DwRgIU6/XwsO5QZbQo9U9PgadnieT7xHzIQ==";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    mv $out/bin/pnpm.cjs $out/bin/pnpm
    mv $out/bin/pnpx.cjs $out/bin/pnpx
    chmod +x $out/bin/{pnpm,pnpx}
  '';
}
