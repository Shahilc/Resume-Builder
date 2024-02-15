import 'package:flutter/material.dart';
import 'package:resumemaker/view/educationPage/educationPage.dart';
import 'package:resumemaker/view/hobbiesPage/hobbiesDetailsPage.dart';
import 'package:resumemaker/view/profilePage/profilePage.dart';
import 'package:resumemaker/view/skillsPage/skillDataPage.dart';
import 'package:resumemaker/view/summeryPage/summeryPage.dart';
import 'package:resumemaker/view/uploadImage/uploadImage.dart';

import 'experienecePage/experiencePage.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Next Page Function
  void onNextPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: [
              UploadImage(
                nextPage: () => onNextPage(1),
              ),
              ProfilePage(
                nextPage: () => onNextPage(2),
              ),
              SummeryPage(
                nextPage: () => onNextPage(3),
              ),
              ExperiencePage(
                nextPage: () => onNextPage(4),
              ),
              EducationPage(
                nextPage: () => onNextPage(5),
              ),
              SkillsDataPage(
                  nextPage: ()=>onNextPage(6)
              ),
              HobbiesPage(
                  nextPage: ()=>onNextPage(7)
              )

            ],
          )),
    );
  }
}
