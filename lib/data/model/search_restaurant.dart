import 'package:kotaktemu/data/model/restaurant.dart';

class SearchedRestaurantResult {
  bool error;
  int founded;
  List restaurants;

  SearchedRestaurantResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });  

  factory SearchedRestaurantResult.fromJson(Map<String, dynamic> json) =>
      SearchedRestaurantResult(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );  
}
