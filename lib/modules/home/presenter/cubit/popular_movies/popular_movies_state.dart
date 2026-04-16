part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final PagingState<int, MovieEntity> pagingState;

  PopularMoviesLoaded(this.pagingState);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}
