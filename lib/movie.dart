class Results {
  bool adult;
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  num popularity;
  String posterPath;
  String releaseDate;
  String title="";
  bool video;
  num voteAverage;
  int voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<dynamic, dynamic> map) {
    adult = map['adult'];
    backdropPath = map['backdrop_path'];
    id = map['id'];
    originalLanguage = map['original_language'];
    originalTitle = map['original_title'];
    overview = map['overview'];
    popularity = map['popularity'];
    posterPath = map['poster_path'] == null ? "" : "https://image.tmdb.org/t/p/w200" + map['poster_path'];
    releaseDate = map['release_date'];
    title = map['title'];
    video = map['video'];
    voteAverage = map['vote_average'];
    voteCount = map['vote_count'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.originalTitle;
    data['imageURL'] = this.posterPath;
    data['vote'] = this.voteCount;
    data['popularity'] = this.popularity;
    data['release'] = this.releaseDate;
    data['overView'] = this.overview;
    return data;
  }




}
