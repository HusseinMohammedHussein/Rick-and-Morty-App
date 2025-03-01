import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/core/database/network/endpoints.dart';
import 'package:rickandmorty_app/core/routes/routers_name.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

class CharacterItemWidget extends StatelessWidget {
  final CharacterModel? character;

  const CharacterItemWidget({super.key, this.character});

  final defaultImage = '$baseURL$charactersEndpoint/avatar/19.jpeg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        character?.image = defaultImage;
        context.pushNamed(characterDetailsRouteName, extra: character);
      },
      child: Container(
          padding: const EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey, width: 0.4)),
          margin: const EdgeInsetsDirectional.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: defaultImage,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name
                  AutoSizeText(
                    '${character?.name}',
                    overflow: TextOverflow.ellipsis,
                    style: bigTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // status
                  Row(
                    children: [
                      AutoSizeText(
                        'Status',
                        style: smallTitleTextStyle,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      AutoSizeText(
                        '${character?.status}',
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // species
                  Row(
                    children: [
                      AutoSizeText(
                        'Species',
                        style: smallTitleTextStyle,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      AutoSizeText(
                        '${character?.species}',
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
