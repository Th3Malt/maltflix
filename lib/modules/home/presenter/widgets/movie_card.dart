import 'package:maltflix/app_imports.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';

    return InkWell(
      onTap: () {
        GoRouter.of(context).push(MoviePage.routeName, extra: {'movie': movie});
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: AppImage(
          image: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (_, _, _) => const Icon(Icons.image_not_supported),
        ),
      ),
    );
  }
}
