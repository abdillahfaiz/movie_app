class MovieResponseModel {
  String title;
  String year;
  String rated;
  String runtime;
  String genre;
  String description;
  String language;
  String poster;
  String imdbRating;
  List<ActorModel> actors;

  MovieResponseModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.runtime,
    required this.genre,
    required this.description,
    required this.language,
    required this.poster,
    required this.imdbRating,
    required this.actors,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonActors = json['Actors'];

    return MovieResponseModel(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      description: json['Description'],
      language: json['Language'],
      poster: json['Poster'],
      imdbRating: json['imdbRating'],
      actors: jsonActors.map((actor) => ActorModel.fromJson(actor)).toList(),
    );
  }

  @override
  String toString() {
    return 'MovieResponseModel(title: $title, year: $year, rated: $rated, runtime: $runtime, genre: $genre, description: $description, language: $language, poster: $poster, imdbRating: $imdbRating, actors: $actors)';
  }
}

class ActorModel {
  String name;
  String picture;

  ActorModel({
    required this.name,
    required this.picture,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      name: json['Name'],
      picture: json['Picture'],
    );
  }

  @override
  String toString() => 'ActorModel(name: $name, picture: $picture)';
}
