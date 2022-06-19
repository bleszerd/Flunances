// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class FormSeparator extends StatelessWidget {
  final SeparatorSize size;

  const FormSeparator({Key? key, this.size = SeparatorSize.NORMAL})
      : super(key: key);

  double getHeight(SeparatorSize size) {
    switch (size) {
      case SeparatorSize.NEAR:
        return 8;
      case SeparatorSize.NORMAL:
        return 26;
      case SeparatorSize.FAR:
        return 56;
      case SeparatorSize.AWAY:
        return 128;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(size),
    );
  }
}

enum SeparatorSize {
  NEAR,
  NORMAL,
  FAR,
  AWAY,
}
