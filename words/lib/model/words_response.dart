class WordsResponse {
  String word;
  List<Results> results;
  Syllables syllables;
  Pronunciation pronunciation;
  double frequency;

  WordsResponse(
      {this.word,
      this.results,
      this.syllables,
      this.pronunciation,
      this.frequency});

  WordsResponse.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    syllables = json['syllables'] != null
        ? new Syllables.fromJson(json['syllables'])
        : null;
    pronunciation = json['pronunciation'] != null
        ? new Pronunciation.fromJson(json['pronunciation'])
        : null;
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    if (this.syllables != null) {
      data['syllables'] = this.syllables.toJson();
    }
    if (this.pronunciation != null) {
      data['pronunciation'] = this.pronunciation.toJson();
    }
    data['frequency'] = this.frequency;
    return data;
  }
}

class Results {
  String definition;
  String partOfSpeech;
  List<String> synonyms;
  List<String> typeOf;
  List<String> hasTypes;
  List<String> derivation;
  List<String> examples;

  Results(
      {this.definition,
      this.partOfSpeech,
      this.synonyms,
      this.typeOf,
      this.hasTypes,
      this.derivation,
      this.examples});

  Results.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    partOfSpeech = json['partOfSpeech'];
    synonyms = json['synonyms'].cast<String>();
    typeOf = json['typeOf'].cast<String>();
    hasTypes = json['hasTypes'].cast<String>();
    derivation = json['derivation'].cast<String>();
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['partOfSpeech'] = this.partOfSpeech;
    data['synonyms'] = this.synonyms;
    data['typeOf'] = this.typeOf;
    data['hasTypes'] = this.hasTypes;
    data['derivation'] = this.derivation;
    data['examples'] = this.examples;
    return data;
  }
}

class Syllables {
  int count;
  List<String> list;

  Syllables({this.count, this.list});

  Syllables.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['list'] = this.list;
    return data;
  }
}

class Pronunciation {
  String all;

  Pronunciation({this.all});

  Pronunciation.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}
