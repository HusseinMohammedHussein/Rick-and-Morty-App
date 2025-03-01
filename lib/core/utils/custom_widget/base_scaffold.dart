import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/core/routes/routers_name.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool isHomeView;

  const BaseScaffold({
    super.key,
    this.isHomeView = true,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        actions: [
          Visibility(
              visible: isHomeView,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(favoritesRouteName);
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.all(20),
                  child: const AutoSizeText(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: SafeArea(child: body),
    );
  }
}
