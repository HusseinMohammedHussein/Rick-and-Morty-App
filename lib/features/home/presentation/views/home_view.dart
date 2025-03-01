
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/base_scaffold.dart';
import 'package:rickandmorty_app/features/home/presentation/widgets/characters_list_widget.dart';
import 'package:rickandmorty_app/features/home/presentation/widgets/filter_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        height: sizeHeight,
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // search
            FilterWidget(),
            Flexible(
              child: CharactersListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
