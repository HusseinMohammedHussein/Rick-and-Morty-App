import 'package:get_it/get_it.dart';
import 'package:rickandmorty_app/core/database/local/cache_helper.dart';
import 'package:rickandmorty_app/core/database/network/dio_consumer.dart';
import 'package:rickandmorty_app/features/favorites/data/repositories/favorites_repo_impl.dart';
import 'package:rickandmorty_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:rickandmorty_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:rickandmorty_app/features/shared/presentation/cubit/favorites_cubit.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerSingleton<CacheHelper>(CacheHelper());
  sl<CacheHelper>().init();
  sl.registerSingleton<DioConsumer>(DioConsumer());

  sl.registerSingleton<HomeRepoImpl>(HomeRepoImpl(sl()));
  sl.registerSingleton<HomeCubit>(HomeCubit(sl()));

  sl.registerSingleton<FavoritesRepoImpl>(FavoritesRepoImpl(sl()));
  sl.registerFactory<FavoritesCubit>(() => FavoritesCubit(sl()));
}
