import 'package:flutter/material.dart';

import '../../constants/mycolors.dart';

class ShowLoadingIndicator extends StatelessWidget {
  const ShowLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
}
