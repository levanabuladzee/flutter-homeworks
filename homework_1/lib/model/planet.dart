class Planet {
  String _name;
  String _imageUrl;
  String _description;

  Planet(this._name, this._imageUrl, this._description);

  String get description => _description;

  String get imageUrl => _imageUrl;

  String get name => _name;
}
