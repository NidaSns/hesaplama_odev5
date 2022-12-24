import 'package:flutter/material.dart';

class TusComponent extends StatelessWidget {
  String value;
  Function onPress;
  TusComponent({required this.value, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 10,
      width: width / 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: Colors.grey,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        child: Text(value),
      ),
    );
  }
}
