import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/presentation/pages/auth/widgets/custom_pinput.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/header.dart';
import 'package:yolda_app/presentation/widgets/main_button.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  late final TextEditingController pinController;

  @override
  void initState() {
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
                    onPressed: () => Routes.checkAndPushHome(context),
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
