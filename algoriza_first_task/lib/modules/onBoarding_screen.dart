import 'package:algoriza_first_task/components/components.dart';
import 'package:algoriza_first_task/constants/constants.dart';
import 'package:algoriza_first_task/modules/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

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
        image: 'assets/images/1.png',
        title: 'Sales Tracker',
        body: 'you can modify your daily sales and track it day by day'),
    BoardingModel(
        image: 'assets/images/2.png',
        title: 'In Store Offer',
        body: 'you will find the updated in store offers'),
    BoardingModel(
        image: 'assets/images/3.png',
        title: 'Internal Exams',
        body: 'we can do our exams with fun'),
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
              onPressed: (() {
                navigateTo(context, const LoginScreen());
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
            children: [
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
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
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
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              color: firstColor,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              color: secondColor,
              fontFamily: 'Helvetica',
              // fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
