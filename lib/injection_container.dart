import 'package:clean_architecture/features/daily_news/data/datasources/local/app_database.dart';
import 'package:clean_architecture/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_save_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //UseCases

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
