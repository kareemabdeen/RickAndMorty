import 'package:RickMorti/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/mycolors.dart';
import '../../data/models/characters_model.dart';
import '../../helper.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateFormat(character.created!.toString());
    return Scaffold(
      backgroundColor: Colors.black54,
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Gender : ", character.gender.toString()),
                      buildDivider(268.w),
                      characterInfo("Status : ",
                          character.statuesIfDeadOrLife.toString()),
                      buildDivider(272.w),
                      characterInfo("Species : ", character.species.toString()),
                      buildDivider(262.w),
                      characterInfo(
                          "Origin : ", character.origin!.name.toString()),
                      buildDivider(275.w),
                      characterInfo(
                          "Location : ", character.location!.name.toString()),
                      buildDivider(256.w),
                      characterInfo("Created At :", formattedDate),
                      buildDivider(240.w),
                      const SizedBox(
                        height: 500,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.screenWidth / 7.6,
                          bottom: 2,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Developed by : ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () => _launchLinkedInURL(),
                              child: Text(
                                "kareem Abdeen ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String dateFormat(String unformattedDate) {
    String apiDate = unformattedDate;

// Create a DateTime object from the API date string
    DateTime createDateTimeObject = DateTime.parse(apiDate);

    String formattedDate =
        DateFormat("  dd-MM-yyyy").format(createDateTimeObject);
    return formattedDate;
  }

  Future<void> _launchLinkedInURL() async {
    var url = Uri.parse(kLinkedinProfile);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      thickness: 2,
      height: 16,
      color: MyColors.myYellow,
      endIndent: endIndent,
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ],
    ));
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      floating: true,
      backgroundColor: MyColors.myGrey,
      centerTitle: true,
      expandedHeight: 460.h,
      title: null, // Remove the existing title widget
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            centerTitle: true,
            background: Hero(
              tag: character.id!.toInt(),
              child: Image.network(
                character.image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.black
                  .withOpacity(0.6), // Customize the background color
              child: Text(
                character.name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
