{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  versionCheckHook,
}:

buildNpmPackage rec {
  pname = "codex";
  version = "0.1.2504221401"; # from codex-cli/package.json

  src = fetchFromGitHub {
    owner = "openai";
    repo = "codex";
    rev = "12bc2dcc4e525154d32a1c5c070dc1f4efb31329";
    hash = "sha256-9wfFV1sPhqpNM50JwswPaz2LJgKfHUUjFCJCjuto9oo=";
  };

  sourceRoot = "${src.name}/codex-cli";

  npmDepsHash = "sha256-mhfZf3JASsJ72gpiXsILaCVHrsq7GaMUCkfNnyRJDl0=";

  doInstallCheck = true;
  nativeInstallCheckInputs = [ versionCheckHook ];

  meta = {
    description = "Lightweight coding agent that runs in your terminal";
    homepage = "https://github.com/openai/codex";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.malo ];
    mainProgram = "codex";
  };
}
