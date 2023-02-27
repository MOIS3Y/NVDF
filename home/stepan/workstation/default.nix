{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Shared configuration
    ../shared
    # Specific configuration
  ];
}

