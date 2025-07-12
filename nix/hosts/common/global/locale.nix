{lib, ...}: {
  # Select internationalisation properties.
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "es_CO.UTF-8";
      LC_IDENTIFICATION = "es_CO.UTF-8";
      LC_MEASUREMENT = "es_CO.UTF-8";
      LC_MONETARY = "es_CO.UTF-8";
      LC_NAME = "es_CO.UTF-8";
      LC_NUMERIC = "es_CO.UTF-8";
      LC_PAPER = "es_CO.UTF-8";
      LC_TELEPHONE = "es_CO.UTF-8";
      LC_TIME = "es_CO.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "es_CO.UTF-8/UTF-8"
    ];
  };

  # Set your time zone.
  time.timeZone = "America/Bogota";
}
