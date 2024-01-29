import 'package:flutter/material.dart';

import '../../constants/mycolors.dart';

class BuildBasicAppbarTitle extends StatelessWidget {
  const BuildBasicAppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .111),
      child: const Text(
        "R i c  k A n d M o r t y",
        style: TextStyle(color: MyColors.myGrey, fontWeight: FontWeight.w700),
      ),
    );
  }
}
