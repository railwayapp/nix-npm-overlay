self: super:

{
  npm-6_x = super.callPackage ./pkgs/npm-6_x { };
  npm-8_x = super.callPackage ./pkgs/npm-8_x { };
  npm-9_x = super.callPackage ./pkgs/npm-9_x { };
  pnpm-6_x = super.callPackage ./pkgs/pnpm-6_x { };
  pnpm-7_x = super.callPackage ./pkgs/pnpm-7_x { };
  pnpm-8_x = super.callPackage ./pkgs/pnpm-8_x { };
  pnpm-9_x = super.callPackage ./pkgs/pnpm-9_x { };
  yarn-1_x = super.callPackage ./pkgs/yarn-1_x { };
}
