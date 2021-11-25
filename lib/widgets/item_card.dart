import 'package:flutter/material.dart';
import 'package:kotaktemu/common/navigation.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/data/model/restaurant.dart';
import 'package:kotaktemu/ui/restaurant_detail_page.dart';

class ItemCard extends StatelessWidget {
  final Restaurant restaurant;

  const ItemCard({required this.restaurant});

  static const double cardBorderRadius = 10;
  static const double imageCardHeight = 180;
  static const double descriptionCardHeight = 90;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.yellow.withAlpha(80),
      onTap: () {
        Navigation.intentWithData(RestaurantDetailPage.routeName, restaurant);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}"),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(18),
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.77,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(color: Colors.black),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: 24,
                              ),
                              Text(
                                restaurant.rating.toString(),
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.place,
                            color: primaryColor,
                            size: 24,
                          ),
                          Text(restaurant.city,style: TextStyle(color: primaryColor),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
