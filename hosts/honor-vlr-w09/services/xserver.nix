# ▀▄▀ █▀ █▀▀ █▀█ █░█ █▀▀ █▀█ ▀
# █░█ ▄█ ██▄ █▀▄ ▀▄▀ ██▄ █▀▄ ▄
# ----------------------------
{
  config,
  pkgs,
  ...
}: 
let
  iniFmt = pkgs.formats.ini { };
  customConfig = {
    General = {
      # [Main]
      # ------

      # Path relative to the theme root directory.
      # Most standard image file formats are allowed 
      # including support for transparency. 
      #(e.g. background.jpeg/illustration.GIF/Foto.png/undraw.svgz)
      Background="Backgrounds/cat-leaves.png";

      # Double between 0 and 1 used for the alpha channel of
      # a darkening overlay. Use to darken your background image on the fly.
      DimBackgroundImage="0.0";

      # Whether the image should be cropped when scaled proportionally.
      # Setting this to false will fit the whole image instead,
      # possibly leaving white space.
      # This can be exploited beautifully with illustrations 
      # (try it with "undraw.svg" included in the theme).
      ScaleImageCropped="true";

      # Adjust to your resolution to help SDDM speed up on calculations
      ScreenWidth="1920";
      ScreenHeight="1080";

      # [Blur Settings]
      # ---------------

      # Enable or disable the blur effect; 
      # if HaveFormBackground is set to true then PartialBlur will trigger
      # the BackgroundColor of the form element to be partially transparent 
      # and blend with the blur.
      FullBlur="false";
      PartialBlur="true";

      # Set the strength of the blur effect. Anything above 100 is pretty strong
      # and might slow down the rendering time. 0 is like setting false for any blur.
      BlurRadius="100";

      # [Design Customizations]
      # -----------------------

      ## Have a full opacity background color behind the form that takes slightly 
      # more than 1/3 of screen estate;  if PartialBlur is set to true 
      # then HaveFormBackground will trigger the BackgroundColor of the form
      # element to be partially transparent and blend with the blur.
      HaveFormBackground="false";

      # Position of the form which takes roughly 1/3 of screen estate. 
      # Can be left, center or right.
      FormPosition="left";

      # Horizontal position of the background picture relative to its visible area. 
      # Applies when ScaleImageCropped is set to false or 
      # when HaveFormBackground is set to true and FormPosition is either left or right. 
      # Can be left, center or right; defaults to center if none is passed.
      BackgroundImageHAlignment="center";

      # As before but for the vertical position of the background picture 
      # relative to its visible area.
      BackgroundImageVAlignment="center";

      # Used for all elements when not focused/hovered etc.
      # Usually the best effect is achieved by having this be either
      # white or a very dark grey like #444 (not black for smoother antialias)
      # Colors can be HEX or Qt names (e.g. red/salmon/blanchedalmond).
      # See https://doc.qt.io/qt-5/qml-color.html
      MainColor="#cdd6f4";

      # Used for elements in focus/hover/pressed.
      # Should be contrasting to the background and the MainColor 
      # to achieve the best effect.
      AccentColor="#89b4fa";

      # Used for the user and session selection background as well
      # as for ScreenPadding and FormBackground when either is true.
      # If PartialBlur and FormBackground are both enabled 
      # this color will blend with the blur effect.
      BackgroundColor="#313244";

      # The text of the login button may become difficult to read depending 
      #on your color choices. Use this option to set it independently for legibility.
      OverrideLoginButtonTextColor="#1e1e2e";

      # Integer used as multiplier. Size of the shadow behind the user 
      # and session selection background. Decrease or increase 
      # if it looks bad on your background.
      # Initial render can be slow no values above 5-7.
      InterfaceShadowSize="6";

      # Double between 0 and 1. 
      # Alpha channel of the shadow behind the user and session selection background. 
      # Decrease or increase if it looks bad on your background.
      InterfaceShadowOpacity="0.6";

      # Integer in pixels. 
      # Radius of the input fields and the login button.
      # Empty for square. Can cause bad antialiasing of the fields.
      RoundCorners="20";

      # Integer in pixels.
      #Increase or delete this to have a padding of color BackgroundColor 
      # all around your screen. 
      # This makes your login greeter appear as if it was a canvas. Cool!
      ScreenPadding="0";

      # If you want to choose a custom font it will have to be available 
      # to the X root user. 
      # See https://wiki.archlinux.org/index.php/fonts#Manual_installation
      Font="Noto Sans";

      # Only set a fixed value if fonts are way too small for your resolution.
      # Preferrably kept empty.
      FontSize="";

      # [Interface Behavior]
      # --------------------

      # Revert the layout either because you would like 
      # the login to be on the right hand side or SDDM won't
      # respect your language locale for some reason.
      # This will reverse the current position of FormPosition if it is either
      # left or right and in addition position some smaller elements
      # on the right hand side of the form itself 
      # (also when FormPosition is set to center).
      ForceRightToLeft="false";

      # Have the last successfully logged in user appear automatically 
      # in the username field.
      ForceLastUser="true";

      # Give automatic focus to the password field.
      # Together with ForceLastUser this makes for the fastest login experience.
      ForcePasswordFocus="true";

      ## If you don't like to see any character at all not even while 
      # being entered set this to true.
      ForceHideCompletePassword="false";

      # Do not show the button for the virtual keyboard at all. 
      # This will completely disable functionality for the virtual keyboard
      # even if it is installed and activated in sddm.conf
      ForceHideVirtualKeyboardButton="false";

      # Completely disable and hide any power buttons on the greeter.
      ForceHideSystemButtons="false";
      
      # Enable login for users without a password. This is discouraged.
      # Makes the login button always enabled.
      AllowEmptyPassword="false";
      
      # Do not change this!
      # Uppercase letters are generally not allowed in usernames.
      # This option is only for systems that differ from this standard! 
      # Also shows username as is instead of capitalized.
      AllowBadUsernames="false";

      # [Locale Settings]
      # -----------------

      # The time and date locale should usually be set in your system settings. 
      # Only hard set this if something is not working by default or you want 
      # a seperate locale setting in your login screen.
      Locale="";

      # Defaults to Locale.ShortFormat - Accepts "long" or a custom string 
      # like "hh:mm A". See http://doc.qt.io/qt-5/qml-qtqml-date.html
      HourFormat="HH:mm";
      
      ## Defaults to Locale.LongFormat - Accepts "short" or a custom string 
      # like "dddd, d 'of' MMMM". See http://doc.qt.io/qt-5/qml-qtqml-date.html
      DateFormat="\"dddd, d MMMM yyyy\"";

      # [Translations]
      # --------------

      # Header can be empty to not display any greeting at all. Keep it short.
      HeaderText="NixOS";
      

      # SDDM may lack proper translation for every element. 
      # Suger defaults to SDDM translations.
      # Please help translate SDDM as much as possible for your language:
      # https://github.com/sddm/sddm/wiki/Localization.
      # These are in order as they appear on screen.
      TranslatePlaceholderUsername="";
      TranslatePlaceholderPassword="";
      TranslateShowPassword="";
      TranslateLogin="";
      TranslateLoginFailedWarning="";
      TranslateCapslockWarning="";
      TranslateSession="";
      TranslateSuspend="";
      TranslateHibernate="";
      TranslateReboot="";
      TranslateShutdown="";
      TranslateVirtualKeyboardButton="";
      # These don't necessarily need to translate anything. You can enter whatever you want here.
    };
  };
  cfgFile = iniFmt.generate "theme.conf.user" customConfig;
  sugar-candy = with pkgs; stdenv.mkDerivation rec {
    pname = "sugar-candy";
    version = "1.6.1";
    userConfig = cfgFile;
    nativeBuildInputs = [ libsForQt5.qt5.wrapQtAppsHook ];
    buildInputs = [
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtsvg
    ];
    src = fetchzip {
      name = "sugar-candy-src-${version}";
      url = "https://git.zhukovsky.me/MOIS3Y/sugar-candy/archive/v${version}.tar.gz";
      hash = "sha256-Qi4hz5sIWQMr9nR/uSiKCsNy4d+Oten8iMCxYNkbVc0=";
      stripRoot = false;
    };
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out
      cp -r $src/sugar-candy/* $out/
      cp $userConfig $out/theme.conf.user
    '';
    onCheck = false;
  };
  # Create an overriden python that has our custom package
    # python = pkgs.python3.override {
    #   self = python;
    #   packageOverrides = self: super: {
    #     base16_colorlib = self.buildPythonPackage rec {
    #       pname = "base16_colorlib";
    #       format = "pyproject";
    #       version = "0.2.0";
    #       src = self.fetchPypi {
    #         inherit pname version;
    #         sha256 = "f0e0eeb50e8f9af1a00950577f6178febcf80ab2bf9bad937f9fe8068936432c";
    #       };
    #       doCheck = false;
    #       nativeBuildInputs = [ self.poetry-core ];
    #     };
    #   };
    # };
in
{
  # environment.systemPackages = [ (python.withPackages(ps: [ ps.base16_colorlib ]))];
  services = {
    xserver = {
      enable = true;
      dpi = 110;
      layout = "us,ru";
      #xkbModel = "pc105";
      #xkbVariant = "dvorak,";
      xkbOptions = "grp:alt_shift_toggle";
      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
        };
      };
      displayManager = {
        gdm = {
          enable = false;
        };
        sddm = {
          enable = true;
          theme = "${(sugar-candy)}";
        };
      };
      desktopManager = {
        gnome = {
          enable = false;
        };
      };
      windowManager = {
        qtile = {
          enable = true;
          backend = "x11";
          # extraPackages = python3Packages: with python3Packages; [
          #   qtile-extras
          #   requests
          # ];
        };
      };
    };
    touchegg = {
      enable = true;
    };
  };
}
