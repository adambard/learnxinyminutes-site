with import <nixpkgs> { };

let middleman_env = bundlerEnv {
    name = "middleman_env";
    ruby = ruby_2_5;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in 
  stdenv.mkDerivation {
    name= "middleman_env";
    buildInputs = [ middleman_env ];

    shellHook = ''
      exec ${middleman_env}/bin/bundle exec middleman --force-polling --verbose
    '';
  }

