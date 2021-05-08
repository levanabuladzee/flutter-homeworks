import 'package:flutter/cupertino.dart';
import 'package:homework_task_4/data/model/movie_model.dart';

class MovieRepository extends ChangeNotifier {
  List<Movie> moviesList = [];
  bool recently, favorites = false;

  void addMovie(Movie movie) {
    moviesList.add(movie);
    notifyListeners();
  }

  void removeMovie(int id) {
    moviesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void editMovie(Movie movie) {
    for (var i = 0; i < moviesList.length; i++) {
      if (moviesList[i].id == movie.id) {
        moviesList.replaceRange(i, i + 1, [movie]);
        break;
      }
    }
    notifyListeners();
  }

  void getRecentlyAdded() {
    recently = true;
    favorites = false;
    notifyListeners();
  }

  void getMyFavorites() {
    recently = false;
    favorites = true;
    notifyListeners();
  }

  void reset() {
    recently = false;
    favorites = false;
    notifyListeners();
  }
}