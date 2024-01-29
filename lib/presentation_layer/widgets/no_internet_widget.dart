import 'package:flutter/material.dart';

import '../../constants/mycolors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Cannot connect .. Check internet",
              style: TextStyle(
                color: MyColors.myGrey,
                fontSize: 22,
              ),
            ),
            Image.asset("assets/images/no_internet.png"),
          ],
        ),
      ),
    );
  }
}
