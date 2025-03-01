import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/enums/filter_enum.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';

import '../cubit/home_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final homeCubit = sl<HomeCubit>();

  ValueNotifier<int> statusFilterSelected = ValueNotifier<int>(-1);
  late TextEditingController findByNameController;
  late TextEditingController findBySpeciesController;


  @override
  void initState() {
    super.initState();
    findByNameController = homeCubit.findByNameController;
    findBySpeciesController = homeCubit.findBySpeciesController;
  }

  @override
  void dispose() {
    findByNameController.dispose();
    findBySpeciesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      width: sizeWidth,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: findByNameController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'find character by name...',
                hintStyle: TextStyle(color: Colors.grey),
                border: borderStyle,
                disabledBorder: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AutoSizeText(
              'Species',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: findBySpeciesController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'find character by species...',
                hintStyle: TextStyle(color: Colors.grey),
                border: borderStyle,
                disabledBorder: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            Container(
              height: 70,
              width: sizeWidth,
              margin: const EdgeInsetsDirectional.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Status',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: StatusFilters.values.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          statusFilterSelected.value = index;
                          homeCubit.findByStatus = StatusFilters.values[index].name;
                          log('status_selected:: ${homeCubit.findByStatus}');
                        },
                        child: ValueListenableBuilder(
                          valueListenable: statusFilterSelected,
                          builder: (_, value, child) => Container(
                            width: 100,
                            margin: const EdgeInsetsDirectional.only(end: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                      0.2,
                                    ),
                                    blurRadius: 20,
                                  )
                                ],
                                color: value == index
                                    ? Colors.black
                                    : Colors.white),
                            child: AutoSizeText(
                              StatusFilters.values[index].name.toUpperCase(),
                              style: infoTextStyle.copyWith(
                                fontSize: 15,
                                color: value == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                log('status_selected:: ${homeCubit.findByStatus}');
                homeCubit.pageNum = 1;
                homeCubit.getCharactersWithFilters();
              },
              child: Container(
                width: sizeWidth,
                alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.only(top: 30),
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                      )
                    ],
                    color: Colors.blueAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: AutoSizeText(
                  'Filter',
                  style: bigTitleTextStyle.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
