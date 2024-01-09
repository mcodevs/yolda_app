import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';
import 'package:yolda_app/presentation/pages/auth/widgets/custom_pinput.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/header.dart';
import 'package:yolda_app/presentation/widgets/main_button.dart';

import '../../../../domain/repositories/auth_service_repo.dart';
import '../../../../infrastructure/implementations/auth/auth_service.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.carNumber,
  }) : super(key: key);

  final String name;
  final String phoneNumber;
  final String carNumber;

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  late final TextEditingController pinController;
  late final AuthServiceRepository authServiceImpl;

  @override
  void initState() {
    authServiceImpl = AuthServiceImpl();
    pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

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
                  const Header(text: "Tasdiqlash"),
                  13.verticalSpace,
                  Image(
                    image: AssetImage(icons.confirm),
                    height: 220.h,
                    width: 206.w,
                    fit: BoxFit.cover,
                  ),
                  const Text("Kirish kodini o'rnating"),
                  15.verticalSpace,
                  CustomPinPut(
                    pinController: pinController,
                  ),
                  const Spacer(),
                  MainButton(
                    onPressed: () async {
                      UserModel userModel = UserModel(
                        isActive: true,
                        name: widget.name,
                        phoneNumber: widget.phoneNumber,
                        password: pinController.text,
                        carNumber: widget.carNumber,
                      );
                      await authServiceImpl
                          .register(userModel: userModel)
                          .then((value) {
                        Routes.checkAndPushHome(context);
                      });
                    },
                    backgroundColor: colors.onPrimary,
                    text: "Tasdiqlash",
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
