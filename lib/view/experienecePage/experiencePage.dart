// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:resumemaker/utils/global_List.dart';
// import 'package:resumemaker/widgets/experiencePage.dart';
// import 'package:resumemaker/widgets/experienceTextField.dart';
//
// import '../utils/app_str.dart';
// import '../widgets/textFields.dart';
//
// class ExperiencePage extends StatefulWidget {
//   const ExperiencePage({super.key, required this.nextPage});
//
//   final VoidCallback nextPage;
//
//   @override
//   State<ExperiencePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ExperiencePage> {
//   final _formKey = GlobalKey<FormState>();
//   final positionController = TextEditingController();
//   final companyNameController = TextEditingController();
//   List<Widget> data = [];
//
//   @override
//
//   saveData() {
//     GlobalList.experienceData.clear();
//     GlobalList.experienceData.add({
//       "Position": positionController.text,
//       "Name": companyNameController.text,
//     });
//     print('GlobalList.experienceData');
//     print(GlobalList.experienceData);
//     print('GlobalList.experienceData');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     ThemeData theme = Theme.of(context);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: theme.primaryColorDark,
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
//           height: size.height,
//           width: size.width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             children: [
//               // Empty Space
//               SizedBox(
//                 height: size.height * 0.1,
//               ),
//               Text(
//                 AppStrings.experienceDetails,
//                 style: theme.textTheme.headlineSmall,
//               ),
//               SizedBox(
//                 height: size.height * 0.1,
//               ),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 10, left: 15, right: 15),
//                       child: SizedBox(
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             children: data.map((e) {
//                               return Slidable(
//                                   endActionPane: ActionPane(
//                                     motion: const ScrollMotion(),
//                                     children: [
//                                       SlidableAction(
//                                         autoClose: true,
//                                         flex: 2,
//                                         backgroundColor:
//                                             const Color(0xFFFE4A49),
//                                         foregroundColor: Colors.white,
//                                         icon: Icons.delete,
//                                         label: 'Delete',
//                                         onPressed: (BuildContext context) {
//                                           setState(() {
//                                             int index = data.indexOf(e);
//                                             data.removeAt(index);
//                                           });
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   child: e);
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           setState(() {
//                             data.add(ExperienceWidgetContainer(
//                               companyNameController: companyNameController,
//                               positionController: positionController,
//                             ));
//                           });
//                         },
//                         icon: Icon(Icons.add))
//                   ],
//                 ),
//               ),
//
//               // Expanded(child: Container()),
//               IconButton(
//                 color: theme.primaryColor,
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     saveData();
//                     widget.nextPage();
//                   }
//                 },
//                 // onPressed: widget.nextPage,
//                 icon: const Icon(Icons.arrow_downward),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:resumemaker/utils/global_List.dart';
import 'package:resumemaker/widgets/experienceWidget/addExperience.dart';
import 'package:resumemaker/widgets/experienceWidget/editExperience.dart';
import '../../utils/app_str.dart';
class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  State<ExperiencePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExperiencePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.primaryColorDark,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // Empty Space
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                AppStrings.experienceDetails,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: GlobalList.experienceData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => EditExperiencePage(data: GlobalList.experienceData[index],index: index),));
                              setState(() {});
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    autoClose: true,
                                    flex: 2,
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    onPressed: (BuildContext context) {
                                      setState(() {
                                        GlobalList.experienceData
                                            .removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: Offset(2, 2))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(
                                          child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.black26)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    '${GlobalList.experienceData[index]['Position']}')),
                                          ],
                                        ),
                                      )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    '${GlobalList.experienceData[index]['CompanyName']}')),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return const AddExperience();
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(Icons.add,size: 40,))
                  ],
                ),
              ),

              // Expanded(child: Container()),
              IconButton(
                color: theme.primaryColor,
                onPressed: () {
                  print(GlobalList.experienceData);
                  if (GlobalList.experienceData.isNotEmpty) {
                    widget.nextPage();
                  }
                },
                // onPressed: widget.nextPage,
                icon: const Icon(Icons.arrow_downward),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
