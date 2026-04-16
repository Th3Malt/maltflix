part of 'now_playing_cubit.dart';

abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final PagingState<int, MovieEntity> pagingState;

  NowPlayingLoaded(this.pagingState);
}

class NowPlayingError extends NowPlayingState {
  final String message;

  NowPlayingError(this.message);
}
