import 'package:flunances/shared/theme/font_size.dart';
import 'package:flunances/shared/widgets/app_input/app_input_controller.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppInput extends StatefulWidget {
  final FocusNode focusNode;
  final InputType inputType;
  final String placeholder;

  const AppInput({
    Key? key,
    required this.focusNode,
    required this.inputType,
    required this.placeholder,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late TextEditingController textController;
  late AppInputController _appInputController;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    _appInputController = AppInputController(
      inputType: widget.inputType,
      focusNode: widget.focusNode,
    );

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _appInputController.updateFieldState(FieldState.UNTOUCHED);
      } else {
        _appInputController.updateFieldState(FieldState.UNFOCUSED);

        _appInputController.validateInput(
          textController.text,
          widget.inputType,
        );
      }
    });
  }

  BoxConstraints getSuffixIconTightPadding() {
    switch (widget.inputType) {
      case InputType.PASSWORD:
        if (widget.focusNode.hasFocus) {
          if (_appInputController.showPassword.value) {
            // Focused and showing password
            return const BoxConstraints.tightFor(width: 38);
          } else {
            // Focused and hidded password
            return const BoxConstraints.tightFor(width: 37);
          }
        }
        break;
      case InputType.TEXT:
        break;
    }

    return const BoxConstraints.tightFor(width: 50);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _appInputController.fieldStateGradient,
        _appInputController.suffixIcon,
        _appInputController.showPassword,
      ]),
      builder: (BuildContext context, _) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.5),
          gradient: _appInputController.fieldStateGradient.value,
        ),
        padding: const EdgeInsets.all(.5),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.surfaceFocused,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            obscureText: widget.inputType == InputType.PASSWORD &&
                !_appInputController.showPassword.value,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.brilhantPrimarySwatch,
            textInputAction: TextInputAction.next,
            controller: textController,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  top: 10, left: 16, right: 4, bottom: 10),
              isDense: true,
              border: InputBorder.none,
              hintText: widget.placeholder,
              suffixIcon: GestureDetector(
                onTap: _appInputController.handleIconOnTap,
                child: _appInputController.suffixIcon.value,
              ),
              suffixIconConstraints: getSuffixIconTightPadding(),
              hintStyle: TextStyle(
                color: _appInputController.hintColor.value.withOpacity(.5),
              ),
            ),
            style: const TextStyle(
              height: 1.7,
              color: AppColors.white,
              fontSize: AppFontSize.normal,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
