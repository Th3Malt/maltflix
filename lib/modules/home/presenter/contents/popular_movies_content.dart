import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maltflix/app_imports.dart';

class PopularMoviesContent extends StatefulWidget {
  const PopularMoviesContent({super.key});

  @override
  State<PopularMoviesContent> createState() => _PopularMoviesContentState();
}

class _PopularMoviesContentState extends State<PopularMoviesContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Populares',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),
        BlocProvider(
          create: (_) => ServiceLocator.locator<PopularMoviesCubit>(),
          child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
            builder: (context, state) {
              final popularMoviesCubit = BlocProvider.of<PopularMoviesCubit>(
                context,
              );
              final pagingState = popularMoviesCubit.pagingState;

              final items = pagingState.pages?.expand((e) => e).toList() ?? [];

              if (state is PopularMoviesLoading && items.isEmpty) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is PopularMoviesError && items.isEmpty) {
                return SizedBox(
                  height: 180,
                  child: Center(child: Text('Erro ao carregar filmes')),
                );
              }
              if (state is PopularMoviesLoaded) {
                return SizedBox(
                  height: 220,
                  child: PagedListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    state: state.pagingState,
                    scrollDirection: Axis.horizontal,
                    fetchNextPage: popularMoviesCubit.fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
                      itemBuilder: (context, movie, index) {
                        return MovieCard(movie: movie);
                      },
                    ),

                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
