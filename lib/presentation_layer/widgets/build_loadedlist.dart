import 'package:flutter/material.dart';

import '../../data/models/characters_model.dart';
import 'build_characters_list.dart';

class BuildLoadedListWidgets extends StatefulWidget {
  const BuildLoadedListWidgets({super.key, required this.characters});
  final List<Character> characters;

  @override
  State<BuildLoadedListWidgets> createState() => _BuildLoadedListWidgetsState();
}

class _BuildLoadedListWidgetsState extends State<BuildLoadedListWidgets> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Container(
        color: const Color.fromARGB(255, 36, 51, 59),
        height: screenSize,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: BuildCharactersList(
                characters: widget.characters,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
