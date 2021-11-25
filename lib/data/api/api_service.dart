import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kotaktemu/data/model/restaurant.dart';
import 'package:kotaktemu/data/model/restaurant_detail.dart';
import 'package:kotaktemu/data/model/search_restaurant.dart';


class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Try Again Later....');
    }
  }

  Future searchRestaurant(query) async {
    final response = await http.get(Uri.parse(_baseUrl + "search?q=$query"));
    if (response.statusCode == 200) {
      return SearchedRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Try Again Later....');
    }
  }

  Future restaurantDetail(id, http.Client client) async {
    final response = await client.get(Uri.parse(_baseUrl + "detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Try Again Later....');
    }
  }
}
