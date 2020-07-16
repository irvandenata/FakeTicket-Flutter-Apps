part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movies;
  final Function onTap;

  const MovieCard(this.movies, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imageBaseURL + "w780" + movies.backdropPath),
              fit: BoxFit.cover)),
      child: Container(
        height: 140,
        width: 210,
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
