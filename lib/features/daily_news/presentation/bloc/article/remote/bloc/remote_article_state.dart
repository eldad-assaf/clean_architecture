part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  const RemoteArticleState();
  
  @override
  List<Object> get props => [];
}

final class RemoteArticleInitial extends RemoteArticleState {}
