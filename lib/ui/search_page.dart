import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/provider/restaurants_provider.dart';
import 'package:kotaktemu/widgets/item_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static final settingsTitle = 'Search';
  static final routeName = '/search_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar(context),
      body: _buildList(),
    );
  }

  PreferredSizeWidget _searchBar(BuildContext context) {
    return AppBar(
        title:Center(
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: 'Find Your Restaurant here',
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onSubmitted: (value) async {
            Provider.of<RestaurantsProvider>(context, listen: false)
                .fetchSearchedRestaurant(value);
          },
        ),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
              child: CircularProgressIndicator(
                  color: primaryColor, strokeWidth: 5));
        } else if (state.state == ResultState.HasData) {
          List restaurant = state.searchedResult;

          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: restaurant.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(restaurant: restaurant[index]);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Column(
              children: [
                Lottie.asset("assets/search.json"),
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              children: [
                Lottie.asset("assets/search.json"),
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
