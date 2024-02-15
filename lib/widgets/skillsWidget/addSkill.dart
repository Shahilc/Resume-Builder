import 'package:flutter/material.dart';
import 'package:resumemaker/utils/global_List.dart';
class AddSkills extends StatefulWidget {
  const AddSkills({super.key});

  @override
  State<AddSkills> createState() => _AlertFormState();
}

class _AlertFormState extends State<AddSkills> {
  TextEditingController controllerTitle=TextEditingController();
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
                        Text('Add Skill',style: TextStyle(fontSize: 25,color: Colors.black26)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: controllerTitle,
                            decoration: const InputDecoration(
                                hintText: 'Skill',
                                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black))),
                            validator: (value){
                              if(value!.isEmpty) return '';
                              return null;
                            },
                          ),
                        ),

                      ],
                    ),

                    InkWell(
                      onTap: (){
                        final validate=_formKey.currentState!.validate();
                        if(validate) {
                          setState(() {
                            GlobalList.skillData.add({'Name':controllerTitle.text});
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
