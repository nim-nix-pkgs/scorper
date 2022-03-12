{
  description = ''micro and elegant web framework'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-scorper-v1_0_9.flake = false;
  inputs.src-scorper-v1_0_9.owner = "bung87";
  inputs.src-scorper-v1_0_9.ref   = "refs/tags/v1.0.9";
  inputs.src-scorper-v1_0_9.repo  = "scorper";
  inputs.src-scorper-v1_0_9.type  = "github";
  
  inputs."chronos".dir   = "nimpkgs/c/chronos";
  inputs."chronos".owner = "riinr";
  inputs."chronos".ref   = "flake-pinning";
  inputs."chronos".repo  = "flake-nimble";
  inputs."chronos".type  = "github";
  inputs."chronos".inputs.nixpkgs.follows = "nixpkgs";
  inputs."chronos".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."npeg".dir   = "nimpkgs/n/npeg";
  inputs."npeg".owner = "riinr";
  inputs."npeg".ref   = "flake-pinning";
  inputs."npeg".repo  = "flake-nimble";
  inputs."npeg".type  = "github";
  inputs."npeg".inputs.nixpkgs.follows = "nixpkgs";
  inputs."npeg".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/nortero-code/rx-nim.git".dir   = "nimpkgs/h/https://github.com/nortero-code/rx-nim.git";
  inputs."https://github.com/nortero-code/rx-nim.git".owner = "riinr";
  inputs."https://github.com/nortero-code/rx-nim.git".ref   = "flake-pinning";
  inputs."https://github.com/nortero-code/rx-nim.git".repo  = "flake-nimble";
  inputs."https://github.com/nortero-code/rx-nim.git".type  = "github";
  inputs."https://github.com/nortero-code/rx-nim.git".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/nortero-code/rx-nim.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."zippy".dir   = "nimpkgs/z/zippy";
  inputs."zippy".owner = "riinr";
  inputs."zippy".ref   = "flake-pinning";
  inputs."zippy".repo  = "flake-nimble";
  inputs."zippy".type  = "github";
  inputs."zippy".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zippy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."result".dir   = "nimpkgs/r/result";
  inputs."result".owner = "riinr";
  inputs."result".ref   = "flake-pinning";
  inputs."result".repo  = "flake-nimble";
  inputs."result".type  = "github";
  inputs."result".inputs.nixpkgs.follows = "nixpkgs";
  inputs."result".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-scorper-v1_0_9"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-scorper-v1_0_9";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}