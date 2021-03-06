{
  description = ''KWin JavaScript API wrapper'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."kwin-master".dir   = "master";
  inputs."kwin-master".owner = "nim-nix-pkgs";
  inputs."kwin-master".ref   = "master";
  inputs."kwin-master".repo  = "kwin";
  inputs."kwin-master".type  = "github";
  inputs."kwin-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kwin-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}