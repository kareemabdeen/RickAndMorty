import 'package:RickMorti/constants/constants.dart';
import 'package:RickMorti/constants/mycolors.dart';
import 'package:RickMorti/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, kAllCharactersScreen);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          child: Stack(
            children: [
              Positioned(
                left: context.screenWidth / 7,
                child: Text(
                  "Rick and Morty ",
                  style: TextStyle(
                    fontSize: 27.sp,
                    color: const Color.fromARGB(255, 209, 192, 243),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHight / 2,
              ),
              Center(
                child: Image.asset(
                  "assets/images/Splashscreen.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 120.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    color: MyColors.myYellow,
                    strokeWidth: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
