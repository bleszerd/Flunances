import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flunances/shared/widgets/app_input/app_input.dart';
import 'package:flunances/shared/widgets/app_input/app_input_controller.dart';
import 'package:flunances/shared/widgets/full_wide_button/full_wide_button.dart';
import 'package:flunances/views/authentication_page/components/form_separator.dart';
import 'package:flutter/material.dart';

class SignInArea extends StatefulWidget {
  const SignInArea({Key? key}) : super(key: key);

  @override
  State<SignInArea> createState() => _SignInAreaState();
}

class _SignInAreaState extends State<SignInArea> {
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    height: 1.5,
                    fontSize: AppFontSize.normal,
                  ),
                  TextSpan(
                    text:
                        "Sign-in with your existent account or create a new one to start",
                  ),
                ),
                const FormSeparator(size: SeparatorSize.FAR),
                AppInput(
                  focusNode: emailFocusNode,
                  placeholder: "E-mail",
                  inputType: InputType.TEXT,
                ),
                const FormSeparator(),
                AppInput(
                  focusNode: passwordFocusNode,
                  placeholder: "Password",
                  inputType: InputType.TEXT,
                ),
                const FormSeparator(size: SeparatorSize.FAR),
                const FullWideButton(),
                const FormSeparator(size: SeparatorSize.AWAY),
              ],
            ),
          ),
        ),
        Container(
          width: screenWidth,
          height: 1,
          color: AppColors.white.withOpacity(.2),
        ),
        Flexible(
            child: RawMaterialButton(
          fillColor: AppColors.brilhantSecondarySwatch,
          splashColor: AppColors.brilhantSecondarySwatchFocused,
          onPressed: () {
            print("haha");
          },
          child: SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                FormSeparator(size: SeparatorSize.NORMAL),
                Text.rich(
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: AppFontSize.normalSmall,
                    shadows: [
                      Shadow(
                        color: AppColors.shadowSoft,
                        offset: Offset(1, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  TextSpan(
                    text: "Not have an account yet? ",
                    children: [
                      TextSpan(
                        text: "Create now!",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                FormSeparator(size: SeparatorSize.NEAR),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
