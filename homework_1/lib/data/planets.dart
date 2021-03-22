import 'package:homework_1/model/planet.dart';

class Planets {
  final List<Planet> _list = [];

  Planets() {
    _list.add(new Planet("Uranus", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Uranus2.jpg/1200px-Uranus2.jpg", "Uranus is about four times wider than Earth. If Earth were a large apple, Uranus would be the size of a basketball."));
    _list.add(new Planet("Saturn", "https://space-facts.com/wp-content/uploads/saturn.png", "Saturn cannot support life as we know it, but some of Saturn's moons have conditions that might support life."));
    _list.add(new Planet("Mars", "https://cdn.vox-cdn.com/thumbor/nDW7YqKV8soKsZSfRorGXJLSH50=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22147179/1229892934.jpg", "The planet is named after Mars, the Roman god of war. It was known to the ancient Greeks as Ares, their god of war."));
  }

  List<Planet> get list => _list;
}