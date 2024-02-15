import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumemaker/utils/global_List.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_str.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({
    super.key,
    required this.nextPage,
  });

  final VoidCallback nextPage;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final picker = ImagePicker();
  File? image;

  getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        GlobalList.image=image.path??"";
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  void initState() {
   print('121313213213213212311313');
   print('121313213213213212311313');
   print(GlobalList.image);
   print('121313213213213212311313');
   print('121313213213213212311313');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
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
                height: size.height * 0.1,
              ),
              Text(
                AppStrings.uploadImage,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),

              InkWell(
                onTap: () async {
                  getImage();
                },
                child: Container(
                    padding: EdgeInsets.all(size.height * .01),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalList.image.isNotEmpty
                        ? CircleAvatar(
                            radius: size.height * .15,
                            backgroundColor: AppColors.darkAppCardColor,
                            backgroundImage: FileImage(File(GlobalList.image ?? "")),
                          )
                        : CircleAvatar(
                            radius: size.height * .15,
                            backgroundColor: AppColors.darkAppCardColor,
                            child:Icon(Icons.camera_alt,color: Colors.white,size: 60) ,
                          )),
              ),

              // Empty Space
              Expanded(child: Container()),
              IconButton(
                color: theme.primaryColor,
                onPressed: () {
                  if ((GlobalList.image).isNotEmpty) {
                    widget.nextPage();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('Please Upload Photo')));
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
