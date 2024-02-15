import 'package:flutter/material.dart';
import 'package:resumemaker/utils/global_List.dart';
class AddExperience extends StatefulWidget {
  const AddExperience({super.key});

  @override
  State<AddExperience> createState() => _AlertFormState();
}

class _AlertFormState extends State<AddExperience> {
  TextEditingController controllerTitle=TextEditingController();
  TextEditingController controllerMessage=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Add Experience',style: TextStyle(fontSize: 25,color: Colors.black26)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: controllerTitle,
                            decoration: const InputDecoration(
                                hintText: 'Position',
                                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black))),
                            validator: (value){
                              if(value!.isEmpty) return '';
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 300.0,
                            ),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: true,
                                child: TextFormField(
                                  maxLines: null,
                                  controller: controllerMessage,
                                  decoration: const InputDecoration(
                                      hintText: 'Company Name',
                                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black))),
                                  validator: (value){
                                    if(value!.isEmpty) return '';
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: (){
                        final validate=_formKey.currentState!.validate();
                        if(validate) {
                          setState(() {
                          GlobalList.experienceData.add({'Position':controllerTitle.text,'CompanyName':controllerMessage.text});
                          });
                          Navigator.pop(context);
                        }else{
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:BorderRadius.circular(5),
                          ),
                          child: const Center(child: Text('SAVE',style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
