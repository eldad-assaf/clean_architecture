import 'package:clean_architecture/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //UseCases

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
