part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {
  final MovieEntity movie;

  MovieLoading(this.movie);
}

class MovieLoaded extends MovieState {
  final MovieDetailsEntity movie;

  MovieLoaded(this.movie);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
