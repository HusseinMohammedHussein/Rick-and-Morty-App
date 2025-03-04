import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/base_scaffold.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/widgets/custom_favorite_button_widget.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/widgets/custom_info_widget.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isHomeView: false,
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: '${character.image}',
                  width: sizeWidth,
                  fit: BoxFit.fill,
                ),
                PositionedDirectional(
                  top: 20,
                  end: 20,
                  child: CustomFavoriteButtonWidget(
                    character: character,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // name
            AutoSizeText(
              '${character.name}',
              maxLines: 2,
              style: bigTitleTextStyle.copyWith(fontSize: 22),
            ),
            spaceHeight20,
            // status
            CustomInfoWidget(
              title: 'Status',
              info: '${character.status}',
            ),
            spaceHeight10,
            // species
            CustomInfoWidget(
              title: 'Species',
              info: '${character.species}',
            ),
            spaceHeight10,
            // Gender
            CustomInfoWidget(
              title: 'Gender',
              info: '${character.gender}',
            ),
            spaceHeight10,
            // Type
            CustomInfoWidget(
              title: 'Type',
              info: character.type!.isNotEmpty ? character.type! : '?',
            ),
            // Origin location & current location. List of episodes they appear in
          ],
        ),
      ),
    );
  }
}
