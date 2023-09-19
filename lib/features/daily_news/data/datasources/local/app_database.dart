// database.dart

// required package imports
import 'dart:async';
import 'package:clean_architecture/features/daily_news/data/datasources/local/DAO/article_dao.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}