import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:yolda_app/presentation/styles/style.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/custom_fab.dart';

class CustomPinPut extends StatefulWidget {
  const CustomPinPut({
    super.key,
    required this.pinController,
  });

  final TextEditingController pinController;

  @override
  State<CustomPinPut> createState() => _CustomPinPutState();
}

class _CustomPinPutState extends State<CustomPinPut> {
  late final FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  static final defaultPinTheme = PinTheme(
    width: 40.r,
    height: 40.r,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Style.black,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Style.black),
    ),
  );

  void onButtonPressed(String value) {
    if (value == "<") {
      widget.pinController.delete();
    } else if (value == "x") {
      widget.pinController.clear();
    } else {
      widget.pinController.append(value, 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          length: 5,
          controller: widget.pinController,
          focusNode: focusNode,
          onSubmitted: (value) => focusNode.unfocus(),
          useNativeKeyboard: false,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => const SizedBox(width: 11),
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: Style.black,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme,
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Style.red),
          ),
        ),
        19.verticalSpace,
        Column(
          children: List.generate(
            4,
            (i) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (j) {
                  final index = i * 3 + j + 1;
                  final value = switch (index) {
                    <= 9 => '$index',
                    == 10 => 'x',
                    == 11 => '0',
                    _ => '<',
                  };
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 8.w,
                    ),
                    child: ThemeWrapper(
                      builder: (colors, fonts, icons, controller) {
                        return CustomFAB(
                          radius: 5,
                          onPressed: () => onButtonPressed(value),
                          size: 55.r,
                          child: Text(
                            value,
                            style: fonts.robotoRegular.copyWith(
                              fontSize: 30.sp,
                              color: colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
