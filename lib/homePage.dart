// import 'package:flutter/material.dart';
// import 'package:resumemaker/utils/app_colors.dart';
// import 'package:resumemaker/utils/app_str.dart';
// import 'package:resumemaker/widgets/summeryText.dart';
// import 'package:resumemaker/widgets/textFields.dart';
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//
//       body: Center(
//         child: ListView(
//           children: [
//             SizedBox(
//               height: size.height * 0.1,
//             ),
//             Container(
//               padding: EdgeInsets.all(size.height * .01),
//               decoration: BoxDecoration(
//                 color: theme.cardColor,
//                 shape: BoxShape.circle,
//               ),
//               child: CircleAvatar(
//                 radius: size.height * .10,
//                 backgroundColor: AppColors.appPrimary,
//                 backgroundImage: const NetworkImage(
//                   AppStrings.imageUrl,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//             TextFieldBox(name: 'Header Line',),
//             TextFieldBox(name: 'Name',),
//             TextFieldBox(name: 'Contact no',),
//             TextFieldBox(name: 'Email id',),
//             TextFieldBox(name: 'Address',),
//             SummeryText(name: 'Summery',)
//           ],
//         ),
//       ),
//
//     );
//   }
// }
