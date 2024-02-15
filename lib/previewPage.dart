import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resumemaker/utils/app_colors.dart';
import 'package:resumemaker/utils/global_List.dart';
class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                child: Container(
                    padding: EdgeInsets.all(size.height * .01),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: size.height * .07,
                      backgroundColor: AppColors.appPrimary,
                      backgroundImage: FileImage(File(GlobalList.image ?? ""))
                    )),
              ),
              Center(
                child: Text(
                  '${GlobalList.profileData[0]['Name']??""}',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Center(
                child: Text(
                  '${GlobalList.profileData[0]['Header']??""}',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.email,size: 20,color: Colors.grey),
                  const SizedBox(width: 10,),
                  Text(
                    '${GlobalList.profileData[0]['EmailId']??""}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.phone,size: 20,color: Colors.grey),
                  const SizedBox(width: 10,),
                  Text(
                    '${GlobalList.profileData[0]['CountryCode']}'+' ${GlobalList.profileData[0]['ContactNo']??""}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,size: 20,color: Colors.grey),
                  const SizedBox(width: 10,),
                  Text(
                    '${GlobalList.profileData[0]['Address']??""}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(color: Colors.grey,),
              Text(
                GlobalList.summeryData,
                style: theme.textTheme.bodySmall,
              ),
              const Divider(color: Colors.grey,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skills',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:GlobalList.skillData.map((e){
                          return Text('. ${e['Name']}',style: theme.textTheme.bodyMedium,);
                        }).toList(),
                      ),

                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Experience',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:GlobalList.experienceData.map((e){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('. ${e['Position']}',style: theme.textTheme.bodyMedium,),
                              Text('     ${e['CompanyName']}',style: theme.textTheme.bodyMedium,),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Education & Qualification',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:GlobalList.educationData.map((e){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('. ${e['University']}',style: theme.textTheme.bodyMedium,),
                              Text('     ${e['CourseName']}',style: theme.textTheme.bodyMedium,),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hobbies',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:GlobalList.hobbiesData.map((e){
                          return Text('. ${e['Name']}',style: theme.textTheme.bodyMedium,);
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
