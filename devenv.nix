{ pkgs, ... }:
{
  packages = with pkgs; [
    git
  ];

  # Node is here only to run the Tailwind CLI that builds styles.css. The site
  # itself is static HTML with no build step.
  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_22;
  };
}
