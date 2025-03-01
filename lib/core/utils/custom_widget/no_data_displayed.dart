import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';

class NoDataDisplayed extends StatelessWidget {
  const NoDataDisplayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: sizeWidth,
        height: 70,
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        padding: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(
            'No Data!',
            style: bigTitleTextStyle.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
