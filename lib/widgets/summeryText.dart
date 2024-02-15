// import 'package:flutter/material.dart';
// class SummeryText extends StatelessWidget {
//   final String name;
//   const SummeryText({super.key, required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  const EdgeInsets.only(top: 10,left: 15,right: 15),
//       child: SizedBox(
//         child:  ConstrainedBox(
//           constraints: BoxConstraints(
//             maxHeight: 300.0,
//           ),
//           child:  Scrollbar(
//             child:  SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               reverse: true,
//               child:  TextField(
//                 maxLines: null,
//                 minLines: 10,
//                 decoration:InputDecoration(
//                   // label: Text(name),
//                   hintStyle: TextStyle(fontSize: 10),
//                   contentPadding: EdgeInsets.only(top: 15,left: 10),
//                   border:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
