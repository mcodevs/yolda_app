import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/presentation/pages/auth/widgets/custom_pinput.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/header.dart';
import 'package:yolda_app/presentation/widgets/main_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, fonts, icons, controller) {
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
              child: Column(
                children: [
                  59.verticalSpace,
                  const Header(text: "Kirish"),
                  18.verticalSpace,
                  Image(
                    width: 154.r,
                    height: 162.r,
                    image: AssetImage(icons.login),
                    fit: BoxFit.cover,
                  ),
                  21.verticalSpace,
                  SizedBox(
                    height: 40.h,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '+998 (##) ###-##-##',
                            filter: {
                              "#": RegExp(r'[0-9]'),
                            },
                          ),
                        ],
                        controller: phoneController,
                        style: fonts.robotoRegular.copyWith(
                          fontSize: 12.sp,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                          hintText: "Telefon raqamingizni kiriting",
                          hintStyle: fonts.robotoRegular.copyWith(
                            fontSize: 12.sp,
                            color: colors.black.withOpacity(0.5),
                          ),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: colors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  6.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kirish kodini kiriting",
                      style: fonts.robotoRegular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  6.verticalSpace,
                  CustomPinPut(
                    pinController: pinController,
                  ),
                  const Spacer(),
                  MainButton(
                    onPressed: () async {
                      try{
                        await context
                            .read<AuthServiceImpl>()
                            .login(
                              phoneNumber: phoneController.text,
                              password: pinController.text,
                            )
                            .then((value) {
                          Routes.checkAndPushHome(context);
                        });
                      }catch(e,s){
                        print("$e --------- $s");
                      }
                    },
                    text: "Keyingi",
                    backgroundColor: colors.onPrimary,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
