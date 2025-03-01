import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/routes/routers_name.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/cubit/export_favorite_cubit.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/views/character_details.dart';
import 'package:rickandmorty_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';
import 'package:rickandmorty_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:rickandmorty_app/features/home/presentation/views/home_view.dart';

import '../di/dependency_injection.dart';

final routes = GoRouter(
  initialLocation: homeRouteName,
  debugLogDiagnostics: true,
  navigatorKey: navigationKey,
  routes: [
    GoRoute(
      path: homeRouteName,
      name: homeRouteName,
      builder: (_, state) =>
          BlocProvider<HomeCubit>(
            create: (_) => sl<HomeCubit>(),
            child: const HomeView(),
          ),
    ),
    GoRoute(
      path: characterDetailsRouteName,
      name: characterDetailsRouteName,
      builder: (_, state) {
        final character = state.extra as CharacterModel;
        return BlocProvider<FavoritesCubit>(
          create: (_) => sl<FavoritesCubit>(),
          child: CharacterDetails(character: character),
        );
      },
    ),
    GoRoute(
      path: favoritesRouteName,
      name: favoritesRouteName,
      builder: (_, state) {
        return const FavoritesView();
      },
    ),
  ],
);
