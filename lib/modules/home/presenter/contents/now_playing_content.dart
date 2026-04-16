import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maltflix/app_imports.dart';

class NowPlayingContent extends StatefulWidget {
  const NowPlayingContent({super.key});

  @override
  State<NowPlayingContent> createState() => _NowPlayingContentState();
}

class _NowPlayingContentState extends State<NowPlayingContent> {
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
              'Em cartaz',
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
          create: (_) => ServiceLocator.locator<NowPlayingCubit>(),
          child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
            builder: (context, state) {
              final nowPlayingCubit = BlocProvider.of<NowPlayingCubit>(context);
              final pagingState = nowPlayingCubit.pagingState;

              final items = pagingState.pages?.expand((e) => e).toList() ?? [];

              if (state is NowPlayingLoading && items.isEmpty) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is NowPlayingError && items.isEmpty) {
                return SizedBox(
                  height: 180,
                  child: Center(child: Text('Erro ao carregar filmes')),
                );
              }
              if (state is NowPlayingLoaded) {
                return SizedBox(
                  height: 220,
                  child: PagedListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    state: state.pagingState,
                    scrollDirection: Axis.horizontal,
                    fetchNextPage: nowPlayingCubit.fetchNextPage,
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
