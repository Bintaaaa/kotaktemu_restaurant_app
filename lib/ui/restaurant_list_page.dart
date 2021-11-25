import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/provider/restaurants_provider.dart';
import 'package:kotaktemu/widgets/item_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  static final routeName = '/main_screen';
  static final double horizontalCardHeight = 280;

  Widget _buildList() {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
              child: CircularProgressIndicator(
                  color: primaryColor, strokeWidth: 5));
        } else if (state.state == ResultState.HasData) {
          List restaurant = state.result;

          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(restaurant: restaurant[index]);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset("assets/error.json"),
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildList());
  }
}
