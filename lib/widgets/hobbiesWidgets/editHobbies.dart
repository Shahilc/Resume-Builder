import 'package:flutter/material.dart';
import 'package:resumemaker/utils/global_List.dart';
class EditHobbies extends StatefulWidget {
  final Map<String, String> data;
  final int index;
  const EditHobbies({super.key, required this.data, required this.index});

  @override
  State<EditHobbies> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditHobbies> {
  TextEditingController controllerTitle=TextEditingController();
  TextEditingController controllerMessage=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    controllerTitle.text=widget.data['Name'].toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10,),
                      const Text('Update Hobbies',style: TextStyle(fontSize: 30,color: Colors.black26),),
                      const Text('details',style: TextStyle(fontSize: 30,color: Colors.black26),),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: controllerTitle,
                          decoration: const InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12))),
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
                        GlobalList.hobbiesData.removeAt(widget.index);
                        setState(() {
                          GlobalList.hobbiesData.add({'Name':controllerTitle.text});
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
            )
        ),
      ),
    );
  }
}
