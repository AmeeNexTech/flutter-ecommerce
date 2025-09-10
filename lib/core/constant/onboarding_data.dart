import 'imageasset.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: 'onboardingTitle1',
    body: 'onboardingBody1',
    img: AppImageasset.onboardingOne,
  ),
  OnBoardingModel(
    title: 'onboardingTitle2',
    body: 'onboardingBody2',
    img: AppImageasset.onboardingTwo,
  ),
  OnBoardingModel(
    title: 'onboardingTitle3',
    body: 'onboardingBody3',
    img: AppImageasset.onboardingThree,
  ),
  OnBoardingModel(
    title: 'onboardingTitle4',
    body: 'onboardingBody4',
    img: AppImageasset.onboardingFour,
  ),
];

class OnBoardingModel {
  final String? title;
  final String? img;
  final String? body;
  OnBoardingModel({this.body, this.img, this.title});
}
