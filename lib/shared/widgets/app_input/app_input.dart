import 'package:flunances/shared/theme/font_size.dart';
import 'package:flunances/shared/widgets/app_input/app_input_controller.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppInput extends StatefulWidget {
  final FocusNode focusNode;
  final InputType inputType;
  final String placeholder;

  const AppInput(
      {Key? key,
      required this.focusNode,
      required this.inputType,
      required this.placeholder})
      : super(key: key);

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
    _appInputController = AppInputController();

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _appInputController.updateFieldState(FieldState.UNTOUCHED);
      } else {
        _appInputController.validateInput(
          textController.text,
          widget.inputType,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _appInputController.fieldStateGradient,
        _appInputController.suffixIcon,
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
          child: Expanded(
            child: TextFormField(
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
                suffixIcon: _appInputController.suffixIcon.value,
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
      ),
    );
  }
}
