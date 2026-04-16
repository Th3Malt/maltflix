import 'package:maltflix/app_imports.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final IMovieRepository movieRepository;
  PopularMoviesCubit(this.movieRepository) : super(PopularMoviesInitial()) {
    _state = PagingState<int, MovieEntity>();
    fetchNextPage();
  }

  late PagingState<int, MovieEntity> _state;

  PagingState<int, MovieEntity> get pagingState => _state;

  Future<void> fetchNextPage() async {
    if (_state.isLoading || !_state.hasNextPage) return;

    emit(PopularMoviesLoading());

    try {
      final page = (_state.keys?.last ?? 0) + 1;

      _state = _state.copyWith(isLoading: true, error: null);
      emit(PopularMoviesLoaded(_state));

      final newItems = await movieRepository.getPopular(page);

      final isLastPage = newItems.length < 20;

      _state = _state.copyWith(
        pages: [...?_state.pages, newItems],
        keys: [...?_state.keys, page],
        hasNextPage: !isLastPage,
        isLoading: false,
      );

      emit(PopularMoviesLoaded(_state));
    } catch (e) {
      _state = _state.copyWith(error: e, isLoading: false);
      emit(PopularMoviesError(e.toString()));
    }
  }

  Future<void> refresh() async {
    _state = PagingState<int, MovieEntity>();
    emit(PopularMoviesInitial());
    await fetchNextPage();
  }
}
