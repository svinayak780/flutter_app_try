import 'package:flutter/material.dart';
import 'package:flutterapptry/model/movie.dart';


class MovieListView extends StatelessWidget {
  final List<Movie> _movies = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white10,
      body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              color: Colors.black,
              child: ListTile(
                title: Text(
                  "${_movies[index].title}",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "${_movies[index].year}",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MovieDetails(movieDetail: _movies[index])));
                },
              ),
            );
          }),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final Movie movieDetail;

  const MovieDetails({Key key, this.movieDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${movieDetail.title}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text(
            "BACK",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => {Navigator.pop(context)},
          color: Colors.white10,
        )),
      ),
    );
  }
}
