import 'package:daily_news/core/resources/data_state.dart';
import 'package:daily_news/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  //api methods
  Future<DataState<List<ArticleEntity>>> getNewsArticale();

  //database methods

  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);
  
  Future<void> removeArticle(ArticleEntity article);
}
