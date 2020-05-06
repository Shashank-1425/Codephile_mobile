import 'package:codephile/screens/login/login.dart';
import 'package:codephile/screens/on_boarding/on_boarding_screen2.dart';
import 'package:codephile/screens/on_boarding/on_boarding_screen3.dart';
import 'package:flutter/material.dart';

class OnBoardingPageModel {
  Widget widgetToDisplay;
  String heading;
  String description;
  OnBoardingPageModel(this.widgetToDisplay, this.heading, this.description);
}


int noOfScreens = 3;
var pageList = [
  OnBoardingPageModel(
    Container(),
    "Get updates on your Feed",
    "Follow people to get updates when they solve a problem"
  ),
  OnBoardingPageModel(
    Container(),
    "Get updates about Contests",
    "Get updates about contests from various coding platforms"
  ),
  OnBoardingPageModel(
    Container(),
    "Check and compare progress",
    "You can check and compare people's progress by visiting their profile"
  ),
];

 handleNextPress(int pageNo, BuildContext context){
  switch(pageNo){
    case 0:
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new OnBoardingScreen2()
        )
      );
      break;
    case 1:
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new OnBoardingScreen3()
          )
      );
      break;
    case 2:
      Navigator.of(context).popUntil((route)=> route.isFirst);
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) => new LoginPage()
          )
      );
      break;
  }
}
