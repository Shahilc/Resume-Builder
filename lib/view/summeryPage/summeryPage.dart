import 'package:flutter/material.dart';
import 'package:resumemaker/utils/global_List.dart';

import '../../utils/app_str.dart';
import '../../widgets/textFields.dart';

class SummeryPage extends StatefulWidget {
  SummeryPage({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  State<SummeryPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SummeryPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController summery = TextEditingController();

  saveData(){
    GlobalList.summeryData=summery.text;
    print(GlobalList.summeryData);
    widget.nextPage();
  }
  @override
  void initState() {
    summery.text=GlobalList.summeryData;
    super.initState();
  }

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
                AppStrings.summery,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: SizedBox(
                            // height: 50,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // Header text
                                  TextFormField(
                                    minLines: 15,
                                    maxLines: null,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Job Details';
                                      }
                                      return null;
                                    },
                                    autofocus: false,
                                    textAlign: TextAlign.left,
                                    controller: summery,
                                    textInputAction: TextInputAction.go,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(fontSize: 10),
                                      contentPadding: EdgeInsets.only(left: 10,top: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black26)),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  // Name text

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              // Expanded(child: Container()),
              IconButton(
                color: theme.primaryColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveData();

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
