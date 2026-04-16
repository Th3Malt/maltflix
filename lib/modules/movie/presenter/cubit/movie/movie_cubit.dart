import 'package:maltflix/app_imports.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final IMovieRepository repository;

  MovieCubit(this.repository) : super(MovieInitial());

  Future<void> loadMovie(MovieEntity initialMovie) async {
    emit(MovieLoading(initialMovie));

    try {
      final details = await repository.getMovieDetails(initialMovie.id);

      emit(MovieLoaded(details));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
