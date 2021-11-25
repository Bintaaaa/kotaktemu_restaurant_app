import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kotaktemu/data/api/api_service.dart';
import 'package:kotaktemu/data/model/restaurant_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;
  RestaurantsProvider({required this.apiService}) {
    fetchAllRestaurant();
  }

  late List _restaurant;
  var _restaurantDetail = null;
  List _searchedRestaurant = [];
  late ResultState _state;
  ResultState _restaurantDetailState = ResultState.Loading;
  String _message = '';


  List get result => _restaurant;
  RestaurantDetail get restaurantDetail => _restaurantDetail;
  List get searchedResult => _searchedRestaurant;
  ResultState get state => _state;
  ResultState get restaurantDetailState => _restaurantDetailState;
  String get message => _message;


  Future<dynamic> fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantResult = await apiService.listRestaurant();
      if (restaurantResult.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'There is No Data in this System';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurant = restaurantResult.restaurants;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'There is No Data in this System';
    }
  }


  Future<dynamic> fetchSearchedRestaurant(query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final searchedRestaurant = await apiService.searchRestaurant(query);
      if (searchedRestaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'There is No Data in this System';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _searchedRestaurant = searchedRestaurant.restaurants;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Find Your Favorite Restaurant';
    }
  }


  Future<dynamic> fetchDetailRestaurant(restaurantId) async {
    try {
      _restaurantDetailState = ResultState.Loading;
      notifyListeners();
      final restaurantDetailResult = await apiService.restaurantDetail(restaurantId, http.Client());
      if (restaurantDetailResult.restaurant == null) {
        _restaurantDetailState = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _restaurantDetailState = ResultState.HasData;
        notifyListeners();
        return _restaurantDetail = restaurantDetailResult.restaurant;
      }
    } catch (e) {
      _restaurantDetailState = ResultState.Error;
      notifyListeners();
      return _message = 'Provider Error --> $e';
    }
  }

}
