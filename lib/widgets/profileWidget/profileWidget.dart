import 'package:flutter/material.dart';
class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String msg;
  final String label;
  const ProfileTextField({super.key, required this.controller, required this.msg, required this.label});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return msg;
        }
        return null;
      },
      autofocus: false,
      textAlign: TextAlign.left,
      controller: controller,
      textInputAction: TextInputAction.go,

      decoration:  InputDecoration(
        label: Text(label),
        hintStyle: const TextStyle(fontSize: 10),
        contentPadding: const EdgeInsets.only(left: 10),
        border: const OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black26)),
      ),
    );
  }
}
