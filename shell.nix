{ pkgs ? import <nixpkgs> {} }:
let
  python = pkgs.python3;
  python-with-packages = python.withPackages (p: with p; [
    pygments
  ]);
in
pkgs.mkShell {
  # packages = [ python-with-packages ];
  buildInputs = [
    pkgs.which
    python-with-packages
    (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-small
        latexmk
        hyperref isodate substr cleveref
        titlesec xcolor changepage
        metafont upquote catchfile xstring
        minted fvextra framed mathpazo;
    })
  ];
}
