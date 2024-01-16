import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/header.dart';
import 'package:yolda_app/presentation/widgets/main_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController _nameController;
  late final TextEditingController _carNumberController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _carNumberController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _carNumberController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.scaffoldBGColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 32.w,
                  right: 32.w,
                  bottom: 47.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      59.verticalSpace,
                      const Header(text: "Ro'yhatdan o'tish"),
                      49.verticalSpace,
                      Image(
                        image: AssetImage(icons.register),
                        height: 260.r,
                        width: 260.r,
                        fit: BoxFit.cover,
                      ),
                      55.verticalSpace,
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Ismingiz va familiyangizni kiriting",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _carNumberController,
                          decoration: const InputDecoration(
                            hintText: "Avtomashina raqamini kiriting",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '+998 (##) ###-##-##',
                              type: MaskAutoCompletionType.eager,
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Telefon raqamizni kiriting",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      MainButton(
                        onPressed: () async {
                          EasyLoading.show();
                          await Future.delayed(const Duration(seconds: 2));
                          if (await FirebaseService.getOrChek(
                                  _phoneController.text) !=
                              null) {
                            EasyLoading.showInfo(
                              "Siz ro'yhatdan o'tgansiz!",
                            );
                          } else if (mounted) {
                            Navigator.push(
                              context,
                              Routes.getConfirmPage(
                                name: _nameController.text,
                                phoneNumber: _phoneController.text,
                                carNumber: _carNumberController.text,
                              ),
                            );
                            EasyLoading.dismiss();
                          }
                        },
                        backgroundColor: colors.onPrimary,
                        text: "Keyingi",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
