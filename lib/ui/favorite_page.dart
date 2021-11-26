import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/provider/database_provider.dart';
import 'package:kotaktemu/utils/result_state.dart';
import 'package:kotaktemu/widgets/item_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatelessWidget {
  static const String bookmarksTitle = 'Favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bookmarksTitle,
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.Loading) {
          return Center(
              child: CircularProgressIndicator(
                  color: primaryColor, strokeWidth: 5));
        } else if (provider.state == ResultState.HasData) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return ItemCard(restaurant: provider.bookmarks[index]);
            },
          );
        } else {
          return Center(
            child: Column(
              children: [
                Lottie.asset("assets/search.json"),
                Text(
                  provider.message,
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
