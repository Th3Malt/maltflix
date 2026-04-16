import 'package:maltflix/app_imports.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final IMovieRepository movieRepository;
  NowPlayingCubit(this.movieRepository) : super(NowPlayingInitial()) {
    _state = PagingState<int, MovieEntity>();
    fetchNextPage();
  }

  late PagingState<int, MovieEntity> _state;

  PagingState<int, MovieEntity> get pagingState => _state;

  Future<void> fetchNextPage() async {
    if (_state.isLoading || !_state.hasNextPage) return;

    emit(NowPlayingLoading());

    try {
      final page = (_state.keys?.last ?? 0) + 1;

      _state = _state.copyWith(isLoading: true, error: null);
      emit(NowPlayingLoaded(_state));

      final newItems = await movieRepository.getNowPlaying(page);

      final isLastPage = newItems.length < 20;

      _state = _state.copyWith(
        pages: [...?_state.pages, newItems],
        keys: [...?_state.keys, page],
        hasNextPage: !isLastPage,
        isLoading: false,
      );

      emit(NowPlayingLoaded(_state));
    } catch (e) {
      _state = _state.copyWith(error: e, isLoading: false);
      emit(NowPlayingError(e.toString()));
    }
  }

  Future<void> refresh() async {
    _state = PagingState<int, MovieEntity>();
    emit(NowPlayingInitial());
    await fetchNextPage();
  }
}
