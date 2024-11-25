import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomoto_task/common/constants/colors.dart';
import 'package:zomoto_task/common/utils/utils.dart';
import 'package:zomoto_task/common/widgets/custom_button.dart';
import 'package:zomoto_task/features/home/main_home/screens/main_home_screen.dart';
import 'dart:developer';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneEditingController = TextEditingController();
  var isSigning = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.4,
            child: Image.asset(
              "assets/images/login_image_1.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Text(
              "India's #1 Food Delivery and Dining App",
              style: textTheme.displayLarge?.copyWith(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 1,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Log in or sign up",
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                      color: grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 25),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: midGrey, width: 1.0)),
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0)
                            .copyWith(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/indian_flag_icon.png",
                              height: 30,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: midGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 4.0)
                        .copyWith(left: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: midGrey, width: 1.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "+91",
                          style: textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextFormField(
                              style: textTheme.bodyMedium,
                              controller: phoneEditingController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isCollapsed: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: "Enter Phone Number",
                                hintStyle: textTheme.bodyLarge?.copyWith(
                                  color: midLightGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pop(context);
                  showSnackBar(context, "Success");
                  Navigator.pushNamed(context, MainHomeScreen.routeName);
                },
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "or",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: grey),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(lightGrey),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    "assets/images/google_icon.png",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(black),
                                overlayColor:
                                    MaterialStateProperty.all(lightGrey),
                                shape: MaterialStateProperty.all(
                                  const CircleBorder(),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.close,
                                  color: white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      topEnd: Radius.circular(15)),
                                  color: white),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 40),
                              child: Column(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      log('fb clicked');
                                    },
                                    /*onPressed: () =>
                                        facebookSignInOrSignUp(context),*/
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.facebook,
                                            color: facebookBlue,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Continue with Facebook",
                                            style:
                                                textTheme.bodyLarge?.copyWith(
                                              color: grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      log('email clicked');
                                    },
                                    // onPressed: emailSignInOrSignUp,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: black,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Continue with Email",
                                            style:
                                                textTheme.bodyLarge?.copyWith(
                                              color: grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      backgroundColor: transparent);
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(lightGrey),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    size: 30,
                    color: black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "By continuing, you agree to our\nTerms of Service, Privacy Policy, and Content Policy",
              style:
                  textTheme.bodyLarge?.copyWith(color: darkGrey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
