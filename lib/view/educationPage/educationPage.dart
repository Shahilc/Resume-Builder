
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:resumemaker/utils/global_List.dart';
import 'package:resumemaker/widgets/educationWidget/addEducation.dart';
import 'package:resumemaker/widgets/educationWidget/editEducation.dart';
import '../../utils/app_str.dart';
class EducationPage extends StatefulWidget {
  const EducationPage({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  State<EducationPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EducationPage> {

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
                AppStrings.educationDetails,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: GlobalList.educationData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                             await Navigator.push(context, MaterialPageRoute(builder: (context) => EditDataPage(data: GlobalList.educationData[index],index: index),));
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
                                        GlobalList.educationData
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
                                                        '${GlobalList.educationData[index]['University']}')),
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
                                                        '${GlobalList.educationData[index]['CourseName']}')),
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
                              return const AddEducation();
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
                  print(GlobalList.educationData);
                  if (GlobalList.educationData.isNotEmpty) {
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
