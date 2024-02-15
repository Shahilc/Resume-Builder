// import 'package:flutter/material.dart';
// class ExperienceTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String errorMsg;
//   const ExperienceTextField({super.key, required this.controller, required this.label, required this.errorMsg});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Enter $errorMsg';
//         }
//         return null;
//       },
//       autofocus: false,
//       textAlign: TextAlign.left,
//       controller: controller,
//       textInputAction: TextInputAction.go,
//       decoration:  InputDecoration(
//         label: Text(label),
//         hintStyle: const TextStyle(fontSize: 10),
//         contentPadding: const EdgeInsets.only(left: 10),
//         border: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black)),
//       ),
//     );
//   }
// }
