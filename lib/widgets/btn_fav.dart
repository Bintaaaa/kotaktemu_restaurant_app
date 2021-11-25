import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/data/model/restaurant.dart';
import 'package:kotaktemu/provider/database_provider.dart';
import 'package:provider/provider.dart';

class BtnFav extends StatefulWidget {
  final Restaurant restaurant;
  const BtnFav({Key? key, required this.restaurant}) : super(key: key);
  @override
  _BtnFavState createState() => _BtnFavState();
}

class _BtnFavState extends State<BtnFav> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = primaryColor;

    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorite(widget.restaurant.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;

            return FloatingActionButton.extended(
              elevation: 10,
              backgroundColor: buttonColor,
              label: Icon(
            isBookmarked ? Icons.favorite : Icons.favorite_border,
              color: whiteColor,
            ),
              onPressed: () {
                if (isBookmarked) {
                  provider.removeFavorite(widget.restaurant.id);
                } else {
                  provider.insertFavorite(widget.restaurant);
                }
              },
            );
          },
        );
      },
    );
  }
}
