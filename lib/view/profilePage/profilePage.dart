import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/Model/modelClass.dart';
import 'package:resumemaker/utils/global_List.dart';
import 'package:resumemaker/widgets/profileWidget/profileWidget.dart';

import '../../utils/app_str.dart';
import '../../widgets/textFields.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController header = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController address = TextEditingController();
  String? countryType="+91";

  @override
  void initState() {
    if(GlobalList.profileData.isNotEmpty){
      header.text=GlobalList.profileData[0]['Header'];
      name.text=GlobalList.profileData[0]['Name'];
      contactNo.text=GlobalList.profileData[0]['ContactNo'];
      emailId.text=GlobalList.profileData[0]['EmailId'];
      address.text=GlobalList.profileData[0]['Address'];
    }

    super.initState();
  }
  saveData(){
    GlobalList.profileData.add({
      "Header":header.text,
      "Name":name.text,
      "CountryCode":countryType,
      "ContactNo":contactNo.text,
      "EmailId":emailId.text,
      "Address":address.text,
    });
    widget.nextPage();
    print(GlobalList.profileData);
  }
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
                AppStrings.profile,
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
                              const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
                          child: SizedBox(
                            // height: 50,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // Header text
                                  ProfileTextField(
                                    controller: header,
                                    label: AppStrings.header,
                                    msg: 'Enter Header',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // Name text
                                  ProfileTextField(
                                    controller: name,
                                    label: AppStrings.name,
                                    msg: 'Enter Name',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Contact No text
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      children: [
                                        CountryCodePicker(
                                          initialSelection: '+91',
                                          favorite: ['+91'],
                                          showCountryOnly: false,
                                          showFlag: true,
                                          showFlagMain: true,
                                          textStyle: const TextStyle(color: Colors.black),
                                          onChanged: (CountryCode country){
                                            countryType=country.dialCode;
                                          },
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              child:TextFormField(
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Enter Mobile no';
                                                  }
                                                  return null;
                                                },
                                                autofocus: false,
                                                textAlign: TextAlign.left,
                                                controller: contactNo,
                                                keyboardType: TextInputType.phone,
                                                textInputAction: TextInputAction.go,
                                                decoration:  const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(fontSize: 10),
                                                  contentPadding: EdgeInsets.only(bottom: 5),
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Email Id text
                                  ProfileTextField(
                                    controller: emailId,
                                    label: AppStrings.emailId,
                                    msg: 'Enter Email id',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Address text
                                  ProfileTextField(
                                    controller: address,
                                    label: AppStrings.address,
                                    msg: 'Enter Address',
                                  ),
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
                    GlobalList.profileData.clear();
                    saveData();
                  }
                },
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
