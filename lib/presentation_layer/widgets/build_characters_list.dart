import 'package:flutter/cupertino.dart';

import '../../data/models/characters_model.dart';
import 'character_item.dart';

class BuildCharactersList extends StatefulWidget {
  const BuildCharactersList({super.key, required this.characters});
  final List<Character> characters;
  @override
  State<BuildCharactersList> createState() => _BuildCharactersListState();
}

class _BuildCharactersListState extends State<BuildCharactersList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: widget.characters[index],
        );
      },
    );
  }
}
