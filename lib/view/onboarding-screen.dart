import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/image-strings.dart';
import 'package:gemglow/constants/text-strings.dart';
import 'package:gemglow/controller/onboarding-controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            reverse: true,
            children: [
              OnBoardingPage(
                image: GImages.onBoardingImage1,
                title: GText.onBoardingTitle1,
                subTitle: GText.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: GImages.onBoardingImage2,
                title: GText.onBoardingTitle2,
                subTitle: GText.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: GImages.onBoardingImage3,
                title: GText.onBoardingTitle3,
                subTitle: GText.onBoardingSubtitle3,
              ),
            ],
          ),
          OnBoardingSkip(),
          OnBoardingDotNavigation(),
          OnBoardingButton()
        ],
      ),
    );
  }
}

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 20.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          elevation: 0.0,
        ),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(
          Icons.arrow_back_ios,
          color: GColor.primaryColor1,
        ),
      ),
    );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: 35.0,
      left: 20,
      child: SmoothPageIndicator(
        textDirection: TextDirection.ltr,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 6,
            dotColor: GColor.primaryColor2,
            activeDotColor: GColor.primaryColor1,
            dotWidth: 10.0),
      ),
    );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15.0,
      right: 15.0,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: Text(
          'Skip',
          style: TextStyle(
              fontFamily: 'Rubic',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: GColor.primaryColor2),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: GHelperFunction.screenWidth() * 0.8,
              height: GHelperFunction.screenHeight() * 0.6,
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Rubic',
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontFamily: 'Rubic',
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
