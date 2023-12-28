class IconSet {
  final String intro;
  final String login;
  final String register;
  final String confirm;

  const IconSet._({
    required this.intro,
    required this.login,
    required this.register,
    required this.confirm,
  });

  static IconSet create() {
    /// IMAGES
    const imagePath = "assets/images";
    const intro = "$imagePath/img_intro.png";
    const login = "$imagePath/img_login.png";
    const register = "$imagePath/img_register.png";
    const confirm = "$imagePath/img_confirm.png";

    return const IconSet._(
      intro: intro,
      login: login,
      register: register,
      confirm: confirm,
    );
  }
}
