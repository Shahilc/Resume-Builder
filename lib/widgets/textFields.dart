// import 'package:flutter/material.dart';
// class TextFieldBox extends StatefulWidget {
//   const TextFieldBox({super.key, required this.name, this.controller});
//   final String name;
//   final TextEditingController ? controller;
//
//   @override
//   State<TextFieldBox> createState() => _TextFieldBoxState();
// }
//
// class _TextFieldBoxState extends State<TextFieldBox> {
//   final _formKeyData = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  const EdgeInsets.only(top: 10,left: 15,right: 15),
//       child: SizedBox(
//         height: 50,
//         child: Form(
//           key: _formKeyData,
//           child: TextField(
//             autofocus: false,
//             textAlign: TextAlign.left,
//             controller: widget.controller,
//             textInputAction: TextInputAction.go,
//             // onSubmitted: (value){
//             //   if(value.isNotEmpty)
//             //   {
//             //     // _fetchWeather("");
//             //     setState(() {
//             //       // TempValues.showWeather=true;
//             //     });
//             //   }
//             // },
//             decoration:InputDecoration(
//               label: Text(widget.name),
//               hintStyle: TextStyle(fontSize: 10),
//               contentPadding: EdgeInsets.only(left: 10),
//               border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
// }
