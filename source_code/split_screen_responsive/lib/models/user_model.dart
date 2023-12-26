import 'dart:convert';

class UsersModel {
  final List<User> users;
  final Info info;

  UsersModel({
    required this.users,
    required this.info,
  });

  /// Load Sample Json Data from [usersDataJson]
  factory UsersModel.loadDataJson() {
    return usersModelFromJson(usersDataJson);
  }

  static UsersModel usersModelFromJson(String str) =>
      UsersModel.fromJson(json.decode(str));
  // end

  factory UsersModel.fromRawJson(String str) =>
      UsersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}

class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class User {
  final Gender gender;
  final Name name;
  final String email;
  final Dob dob;
  final Picture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.email,
    required this.dob,
    required this.picture,
    required this.nat,
  });

  factory User.blankDefaultValues() {
    return User(
      gender: Gender.male,
      name: Name(title: '', first: '', last: ''),
      email: '',
      dob: Dob(date: DateTime.now(), age: 0),
      picture: Picture(large: '', medium: '', thumbnail: ''),
      nat: '',
    );
  }

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: genderValues.map[json["gender"]]!,
        name: Name.fromJson(json["name"]),
        email: json["email"],
        dob: Dob.fromJson(json["dob"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": genderValues.reverse[gender],
        "name": name.toJson(),
        "email": email,
        "dob": dob.toJson(),
        "picture": picture.toJson(),
        "nat": nat,
      };
}

class Dob {
  final DateTime date;
  final int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}

enum Gender { female, male }

final genderValues = EnumValues({"female": Gender.female, "male": Gender.male});

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromRawJson(String str) => Picture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// Sample Data
const usersDataJson = '''
{
  "users": [
    {
      "gender": "female",
      "name": {
        "title": "Ms",
        "first": "Tania",
        "last": "Bravo"
      },
      "email": "tania.bravo@example.com",
      "dob": {
        "date": "1996-09-16T10:08:25.204Z",
        "age": 27
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/72.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/72.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/72.jpg"
      },
      "nat": "MX"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Youssef",
        "last": "Molnes"
      },
      "email": "youssef.molnes@example.com",
      "dob": {
        "date": "1947-03-14T06:38:26.584Z",
        "age": 76
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/24.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/24.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/24.jpg"
      },
      "nat": "NO"
    },
    {
      "gender": "female",
      "name": {
        "title": "Ms",
        "first": "Silke",
        "last": "Madsen"
      },
      "email": "silke.madsen@example.com",
      "dob": {
        "date": "1982-12-31T02:20:34.679Z",
        "age": 40
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/86.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/86.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/86.jpg"
      },
      "nat": "DK"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Tidemann",
        "last": "Warholm"
      },
      "email": "tidemann.warholm@example.com",
      "dob": {
        "date": "1982-12-01T06:25:39.235Z",
        "age": 41
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/75.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
      },
      "nat": "NO"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Niklas",
        "last": "Rintala"
      },
      "email": "niklas.rintala@example.com",
      "dob": {
        "date": "1964-09-06T02:32:36.130Z",
        "age": 59
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/5.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/5.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/5.jpg"
      },
      "nat": "FI"
    },
    {
      "gender": "female",
      "name": {
        "title": "Mrs",
        "first": "Keya",
        "last": "Mugeraya"
      },
      "email": "keya.mugeraya@example.com",
      "dob": {
        "date": "1990-11-28T10:39:45.446Z",
        "age": 33
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/64.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/64.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/64.jpg"
      },
      "nat": "IN"
    },
    {
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Leonor",
        "last": "Granados"
      },
      "email": "leonor.granados@example.com",
      "dob": {
        "date": "1976-05-26T01:54:12.123Z",
        "age": 47
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/84.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/84.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/84.jpg"
      },
      "nat": "MX"
    },
    {
      "gender": "female",
      "name": {
        "title": "Mrs",
        "first": "Diane",
        "last": "Cox"
      },
      "email": "diane.cox@example.com",
      "dob": {
        "date": "2000-10-15T08:19:46.481Z",
        "age": 23
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/38.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/38.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/38.jpg"
      },
      "nat": "IE"
    },
    {
      "gender": "female",
      "name": {
        "title": "Mrs",
        "first": "Asta",
        "last": "Ande"
      },
      "email": "asta.ande@example.com",
      "dob": {
        "date": "1961-12-01T05:33:52.207Z",
        "age": 62
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/94.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/94.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/94.jpg"
      },
      "nat": "DK"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Luke",
        "last": "Rodriguez"
      },
      "email": "luke.rodriguez@example.com",
      "dob": {
        "date": "1957-10-09T08:01:46.181Z",
        "age": 66
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/47.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/47.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/47.jpg"
      },
      "nat": "AU"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Justin",
        "last": "Addy"
      },
      "email": "justin.addy@example.com",
      "dob": {
        "date": "1953-05-31T08:43:45.032Z",
        "age": 70
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/61.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/61.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/61.jpg"
      },
      "nat": "CA"
    },
    {
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Eden",
        "last": "Thomas"
      },
      "email": "eden.thomas@example.com",
      "dob": {
        "date": "1987-10-21T03:14:14.997Z",
        "age": 36
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/28.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/28.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/28.jpg"
      },
      "nat": "NZ"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Nathan",
        "last": "Singh"
      },
      "email": "nathan.singh@example.com",
      "dob": {
        "date": "1957-06-29T18:04:00.334Z",
        "age": 66
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/22.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/22.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/22.jpg"
      },
      "nat": "NZ"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Dexter",
        "last": "Janissen"
      },
      "email": "dexter.janissen@example.com",
      "dob": {
        "date": "1949-01-11T01:36:57.038Z",
        "age": 74
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/32.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/32.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/32.jpg"
      },
      "nat": "NL"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Okan",
        "last": "Fahri"
      },
      "email": "okan.fahri@example.com",
      "dob": {
        "date": "1980-05-02T05:41:48.681Z",
        "age": 43
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/10.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/10.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/10.jpg"
      },
      "nat": "TR"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Ayan",
        "last": "Stranden"
      },
      "email": "ayan.stranden@example.com",
      "dob": {
        "date": "1959-08-14T11:42:35.704Z",
        "age": 64
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/35.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/35.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/35.jpg"
      },
      "nat": "NO"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Adolf",
        "last": "Thom"
      },
      "email": "adolf.thome@example.com",
      "dob": {
        "date": "1980-10-04T09:29:03.545Z",
        "age": 43
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/16.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/16.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/16.jpg"
      },
      "nat": "DE"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Vincent",
        "last": "Mackay"
      },
      "email": "vincent.mackay@example.com",
      "dob": {
        "date": "1955-02-19T21:52:01.345Z",
        "age": 68
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/84.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/84.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/84.jpg"
      },
      "nat": "CA"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Pascual",
        "last": "Monroy"
      },
      "email": "pascual.monroy@example.com",
      "dob": {
        "date": "1996-12-22T10:20:43.562Z",
        "age": 26
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/53.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/53.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/53.jpg"
      },
      "nat": "MX"
    },
    {
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Ceyhan",
        "last": "Polat"
      },
      "email": "ceyhan.polat@example.com",
      "dob": {
        "date": "1963-01-01T13:57:08.483Z",
        "age": 60
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/79.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/79.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/79.jpg"
      },
      "nat": "TR"
    },
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Mason",
        "last": "Ryan"
      },
      "email": "mason.ryan@example.com",
      "dob": {
        "date": "1996-08-03T06:44:52.275Z",
        "age": 27
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/89.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/89.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/89.jpg"
      },
      "nat": "GB"
    },
    {
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Perla",
        "last": "Cornejo"
      },
      "email": "perla.cornejo@example.com",
      "dob": {
        "date": "1965-11-23T02:46:00.228Z",
        "age": 58
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/74.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/74.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/74.jpg"
      },
      "nat": "MX"
    },
    {
      "gender": "female",
      "name": {
        "title": "Mrs",
        "first": "Leila",
        "last": "Bergheim"
      },
      "email": "leila.bergheim@example.com",
      "dob": {
        "date": "1991-01-07T06:11:07.190Z",
        "age": 32
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/12.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/12.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/12.jpg"
      },
      "nat": "NO"
    },
    {
      "gender": "female",
      "name": {
        "title": "Mrs",
        "first": "Margaux",
        "last": "Gautier"
      },
      "email": "margaux.gautier@example.com",
      "dob": {
        "date": "1966-09-20T20:19:33.681Z",
        "age": 57
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/50.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/50.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/50.jpg"
      },
      "nat": "FR"
    },
    {
      "gender": "female",
      "name": {
        "title": "Ms",
        "first": "Jade",
        "last": "Bergeron"
      },
      "email": "jade.bergeron@example.com",
      "dob": {
        "date": "1956-08-06T04:11:39.056Z",
        "age": 67
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/36.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/36.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/36.jpg"
      },
      "nat": "CA"
    }
  ],
  "info": {
    "seed": "675a62cc6c508be7",
    "results": 25,
    "page": 1,
    "version": "1.4"
  }
}
''';
