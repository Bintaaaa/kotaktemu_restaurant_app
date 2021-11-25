class Foods {
  String name;

  Foods({required this.name});

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
    name: json["name"],
  );
}

class Drinks {
  String name;

  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
    name: json["name"],
  );
}

class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Foods>.from(json["foods"].map((x) => Foods.fromJson(x))),
    drinks: List<Drinks>.from(json["drinks"].map((x) => Drinks.fromJson(x))),
  );
}