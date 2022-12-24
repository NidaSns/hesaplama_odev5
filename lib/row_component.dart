import 'package:flutter/material.dart';

import 'tus_component.dart';

class RowComponent extends StatelessWidget {
  String value1;
  String value2;
  String value3;
  Function onPress1;
  Function onPress2;
  Function onPress3;

  RowComponent(
      {required this.value1,
      required this.value2,
      required this.value3,
      required this.onPress1,
      required this.onPress2,
      required this.onPress3,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TusComponent(value: value1, onPress: onPress1),
        TusComponent(value: value2, onPress: onPress2),
        TusComponent(value: value3, onPress: onPress3),
      ],
    );
  }
}
