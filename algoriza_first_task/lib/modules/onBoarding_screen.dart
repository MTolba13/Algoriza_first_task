// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:algoriza_first_task/components/components.dart';
import 'package:algoriza_first_task/constants/constants.dart';
import 'package:algoriza_first_task/modules/register_screen.dart';
import 'package:algoriza_first_task/modules/signin_Screen.dart';

class BoardingModel {
  final String image;
  final String title;

  final String body;

  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'images/1.png',
        body: 'Get food delivery to your \ndoorstep asap',
        title:
            'We have young and professional Delivery n\team that will bring your food as soon as possible'),
    BoardingModel(
        image: 'images/2.png',
        body: 'Buy Any Food from your \nfavourite resturant',
        title:
            'we adding your favourite n\resturant throughout the terriorty and around your area'),
    BoardingModel(
      image: 'images/3.png',
      body: 'Buy Any Food from your \nfavourite resturant',
      title:
          'we adding your favourite n\resturant throughout the terriorty and around your area',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          DefaultButton(
            textColor: Colors.black,
            onPressed: (() {
              navigateTo(context, const SignInScreen());
            }),
            width: 90,
            color: const Color.fromRGBO(250, 242, 231, 1),
            isUpperCase: false,
            radius: 90,
            text: 'skip',
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/Algoriza.png', fit: BoxFit.cover),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(
                  boarding[index],
                ),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    activeDotColor: firstColor,
                    dotColor: secondColor,
                    dotHeight: 10,
                    expansionFactor: 3,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                  controller: boardController,
                  count: boarding.length,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              textColor: Colors.white,
              color: const Color.fromRGBO(81, 175, 171, 1),
              width: 420,
              isUpperCase: true,
              onPressed: () {
                navigateTo(context, const SignInScreen());
              },
              radius: 10,
              text: 'Get Started',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an acount ?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      navigateTo(context, const RegisterScreen());
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(81, 175, 171, 1),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget responsible for creating The onBoarding Item

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(model.image),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              model.body,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              model.title,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
}
