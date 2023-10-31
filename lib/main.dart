import 'package:daily_news/config/routes/app_routes.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_event.dart';
import 'package:daily_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:daily_news/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Daily_news',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
