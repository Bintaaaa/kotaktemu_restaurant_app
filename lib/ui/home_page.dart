import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/ui/restaurant_detail_page.dart';
import 'package:kotaktemu/ui/restaurant_list_page.dart';
import 'package:kotaktemu/ui/search_page.dart';
import 'package:kotaktemu/ui/settings_page.dart';
import 'package:kotaktemu/utils/notification_helper.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kotak Temu',
          style: TextStyle(color: whiteColor, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return SearchPage();
                    }));
              },
              icon: const Icon(Icons.search, color: whiteColor)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return BookmarksPage();
                    }));
              },
              icon: const Icon(Icons.favorite, color: whiteColor)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return SettingsPage();
                    }));
              },
              icon: const Icon(Icons.settings, color: whiteColor))
        ],
      ),
      body: RestaurantListPage(),

    );
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        RestaurantDetailPage.routeName);
  }
  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

}
