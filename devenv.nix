{ pkgs, ... }:
{
  # Hugo builds the site; pagefind indexes it afterwards. The hugo version here
  # comes from devenv.lock. .github/workflows/pages.yml pins its own literal —
  # keep the two in step.
  packages = with pkgs; [
    git
    hugo
    pagefind
  ];
}
