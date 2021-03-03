class LoadData{
  final String title;
  final String year;
  final String rated;
  final String  released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String ratings;
  final String metascore;
  final String imdbrating;
  final String imdbvotes;
  final String imdbid;
  final String type;
  final String dvd;
  final String boxoffice;
  final String production;
  final String website;
  final String response;
  LoadData({this.year, this.rated, this.released, this.runtime, this.genre, this.director, this.writer, this.actors, this.plot, this.language, this.country, this.awards, this.poster, this.ratings, this.metascore, this.imdbrating, this.imdbvotes, this.imdbid, this.type, this.dvd, this.boxoffice, this.production, this.website, this.response, this.title});

  factory LoadData.fromJson(Map<String, dynamic>json){
    return LoadData(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      language: json['Language'],
      country: json['Country'],
      awards: json['Awards'],
      poster: json['Poster'],
      ratings: json['Ratings'],
      metascore: json['Metascore'],
      imdbrating: json['imdbRating'],
      imdbvotes: json['imdbVotes'],
      imdbid: json['imdbID'],
      type: json['Type'],
      dvd: json['DVD'],
      boxoffice: json['BoxOffice'],
      production: json['Production'],
      website: json['Website'],
      response: json['Response'],
    );
  }

}