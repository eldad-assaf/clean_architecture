import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  RemoteArticleBloc() : super(RemoteArticleInitial()) {
    on<RemoteArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
