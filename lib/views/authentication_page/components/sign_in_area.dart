import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flunances/shared/widgets/app_input/app_input.dart';
import 'package:flunances/shared/widgets/app_input/app_input_controller.dart';
import 'package:flunances/shared/widgets/full_wide_button/full_wide_button.dart';
import 'package:flunances/views/authentication_page/components/form_separator.dart';
import 'package:flutter/cupertino.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppInput(
          focusNode: emailFocusNode,
          placeholder: "E-mail",
          inputType: InputType.TEXT,
        ),
        const FormSeparator(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppInput(
              focusNode: passwordFocusNode,
              placeholder: "Create a new password",
              inputType: InputType.TEXT,
            ),
            const FormSeparator(size: SeparatorSize.NEAR),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Password must contains numbers, letters and a special character (\$#%!*...)",
                style: TextStyle(
                  color: AppColors.primarySwatch.withOpacity(.5),
                  fontSize: AppFontSize.small,
                ),
              ),
            )
          ],
        ),
        const FormSeparator(size: SeparatorSize.FAR),
        const FullWideButton(),
      ],
    );
  }
}
