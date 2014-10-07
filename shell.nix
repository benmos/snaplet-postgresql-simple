let pkgs = import <nixpkgs> {};
    haskellPackages = pkgs.haskellPackages.override {
      extension = self: super: {
        snapletPostgresqlSimple          = self.callPackage ./. {};
      };
    };
 in pkgs.lib.overrideDerivation haskellPackages.snapletPostgresqlSimple (attrs: {
   buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
 })
