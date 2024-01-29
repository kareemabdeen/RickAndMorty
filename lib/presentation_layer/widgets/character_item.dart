import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(224, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            kCharacterDetailsScreen,
            arguments: character,
          );
        },
        child: GridTile(
          footer: Hero(
            tag: character.id!.toInt(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Center(
                child: Text(
                  character.name.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    height: 1.3,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // to put .... if the name of character is geeting as mush as constrained i put it
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          child: character.image.toString().isEmpty
              ? Image.asset(
                  "assets/images/WhatsApp Image 2022-12-10 at 1.22.58 AM - Copy (2).jpeg",
                )
              : FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading.gif",
                  image: character.image.toString(),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
