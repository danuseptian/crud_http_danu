import 'package:flutter/material.dart';

class LoginCheckbox extends StatelessWidget {
  const LoginCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            isChecked = value!;
          },
        ),
        const Text(
          'Keep username',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
