// ignore_for_file: constant_identifier_names

import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppInputController {
  ValueNotifier<LinearGradient?> fieldStateGradient = ValueNotifier(null);
  ValueNotifier<Widget?> suffixIcon = ValueNotifier(null);
  ValueNotifier<Color> hintColor = ValueNotifier(AppColors.secondarySwatch);
  ValueNotifier<bool> showPassword = ValueNotifier(false);

  FieldState? fieldState = FieldState.UNTOUCHED;
  final InputType inputType;
  final FocusNode focusNode;

  AppInputController({
    this.inputType = InputType.TEXT,
    required this.focusNode,
  }) {
    _handleSoftComponentUpdate([
      ComponentUpdateSchema.GRADIENT_DECORATION,
      ComponentUpdateSchema.GRADIENT_DECORATION,
    ]);
  }

  void _handleSoftComponentUpdate(List<ComponentUpdateSchema> updateSchema) {
    if (updateSchema.contains(ComponentUpdateSchema.GRADIENT_DECORATION)) {
      generateFieldGradientDecoration();
    }

    if (updateSchema.contains(ComponentUpdateSchema.SUFFIX_ICON)) {
      updateSuffixIcon();
    }

    if (updateSchema.contains(ComponentUpdateSchema.HINT_COLOR)) {
      updateHintColor();
    }
  }

  void updateFieldState(FieldState fieldState) {
    this.fieldState = fieldState;

    _handleSoftComponentUpdate([
      ComponentUpdateSchema.GRADIENT_DECORATION,
      ComponentUpdateSchema.SUFFIX_ICON,
      ComponentUpdateSchema.HINT_COLOR,
    ]);
  }

  updateSuffixIcon() {
    Widget? icon;

    switch (fieldState) {
      case FieldState.SUCCESS:
        icon = const Icon(Icons.check, color: AppColors.success);
        break;
      case FieldState.ERROR:
        icon = const Icon(Icons.error_outline, color: AppColors.error);
        break;
      case FieldState.UNFOCUSED:
        break;
      case FieldState.UNTOUCHED:
        if (inputType == InputType.PASSWORD && focusNode.hasFocus) {
          icon = showPassword.value
              ? const FaIcon(
                  FontAwesomeIcons.eyeSlash,
                  color: AppColors.white,
                )
              : const FaIcon(
                  FontAwesomeIcons.eye,
                  color: AppColors.white,
                );
        }
        break;
      default:
    }

    suffixIcon.value = icon;
  }

  updateHintColor() {
    Color? color;

    switch (fieldState) {
      case FieldState.ERROR:
        color = AppColors.error;
        break;
      default:
        color = AppColors.secondarySwatch;
    }

    hintColor.value = color;
  }

  void generateFieldGradientDecoration() {
    LinearGradient gradient;

    switch (fieldState) {
      case FieldState.SUCCESS:
        gradient = const LinearGradient(
          colors: [
            AppColors.success,
            AppColors.success,
          ],
        );
        break;
      case FieldState.ERROR:
        gradient = const LinearGradient(
          colors: [
            AppColors.error,
            AppColors.error,
          ],
        );
        break;
      default:
        gradient = const LinearGradient(
          colors: [
            AppColors.primarySwatch,
            AppColors.secondarySwatch,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
        break;
    }

    fieldStateGradient.value = gradient;
  }

  validateInput(String? value, InputType inputType) {
    if (value == null) {
      return _handleSoftComponentUpdate([
        ComponentUpdateSchema.GRADIENT_DECORATION,
        ComponentUpdateSchema.SUFFIX_ICON,
      ]);
    }

    switch (inputType) {
      case InputType.TEXT:
        if (value.trim() != "") {
          updateFieldState(FieldState.SUCCESS);
        } else {
          updateFieldState(FieldState.ERROR);
        }
        break;
      case InputType.PASSWORD:
        if (value.trim() != "") {
          updateFieldState(FieldState.SUCCESS);
        } else {
          updateFieldState(FieldState.ERROR);
        }
        break;
      default:
    }
  }

  void handleIconOnTap() {
    switch (inputType) {
      case InputType.PASSWORD:
        showPassword.value = showPassword.value ? false : true;

        _handleSoftComponentUpdate([
          ComponentUpdateSchema.SUFFIX_ICON,
        ]);
        break;
      default:
    }
  }
}

enum FieldState {
  UNTOUCHED,
  UNFOCUSED,
  SUCCESS,
  PASSWORD_FOCUSED_SHOW,
  ERROR,
}

enum InputType {
  TEXT,
  PASSWORD,
}

enum ComponentUpdateSchema {
  GRADIENT_DECORATION,
  SUFFIX_ICON,
  HINT_COLOR,
}
