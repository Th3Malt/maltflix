import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maltflix/app_imports.dart';

class MoviePage extends StatelessWidget {
  static const routeName = '/movie';

  final MovieEntity movie;

  const MoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceLocator.locator<MovieCubit>()..loadMovie(movie),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            String image = movie.posterPath;
            String overview = movie.overview;
            double? vote;
            List<String>? genres;

            if (state is MovieLoaded) {
              overview = state.movie.overview;
              vote = state.movie.voteAverage;
              genres = state.movie.genres.map((e) => e.name).toList();
            }

            if (state is MovieError) {
              return const Center(
                child: Text(
                  'Erro ao carregar',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final imageUrl = 'https://image.tmdb.org/t/p/original$image';

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 500,
                  backgroundColor: Colors.black,
                  pinned: true,
                  leading: const BackButton(color: Colors.white),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        AppImage(
                          image: imageUrl,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.3, 0.7, 1],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 30,
                          left: 16,
                          right: 16,
                          child: Column(
                            children: [
                              Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),

                              const SizedBox(height: 12),

                              if (vote != null)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${(vote * 10).toInt()}% relevante',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'HD',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),

                              const SizedBox(height: 16),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Assistir',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.add, color: Colors.white),
                                        SizedBox(width: 6),
                                        Text(
                                          'Minha Lista',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (genres != null)
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: genres
                                .map(
                                  (g) => Text(
                                    g,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),

                        const SizedBox(height: 16),
                        const Text(
                          'Sobre o filme',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),
                        Text(
                          overview,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
