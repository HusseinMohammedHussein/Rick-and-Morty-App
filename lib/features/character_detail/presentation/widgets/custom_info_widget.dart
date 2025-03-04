import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';

class CustomInfoWidget extends StatelessWidget {
  final String? title;
  final String? info;
  const CustomInfoWidget({super.key, this.title, this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          title!,
          style: smallTitleTextStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(
          width: 15,
        ),
        AutoSizeText(
          info!,
          style: infoTextStyle.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
