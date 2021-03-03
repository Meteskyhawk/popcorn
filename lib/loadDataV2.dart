class LoadDataV2 {
  final bool adult;
  final String backdrop_path;
  final Object belongs_to_collection;
  final int budget;
  final List<Object> genres;
  final String homepage;
  final int id;
  final String imdb_id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Object> production_companies;
  final List<Object> production_countries;
  final String release_date;
  final int revenue;
  final int runtime;
  final List<Object> spoken_languages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  LoadDataV2(
      {this.spoken_languages, this.adult, this.backdrop_path, this.belongs_to_collection, this.budget, this.genres, this.homepage, this.id, this.imdb_id, this.original_language, this.original_title, this.overview, this.popularity, this.poster_path, this.production_companies, this.production_countries, this.release_date, this.revenue, this.runtime, this.status, this.tagline, this.title, this.video, this.vote_average, this.vote_count});

  factory LoadDataV2.fromJson(Map<String, dynamic>json){
    return LoadDataV2(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      belongs_to_collection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: json['genres'],
      homepage: json['homepage'],
      id: json['id'],
      imdb_id: json['imdb_id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      production_companies: json['production_companies'],
      production_countries: json['production_countries'],
      release_date: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spoken_languages: json['spoken_languages'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }
}