import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kotaktemu/provider/database_provider.dart';
import 'package:kotaktemu/provider/preferences_provider.dart';
import 'package:kotaktemu/provider/restaurants_provider.dart';
import 'package:kotaktemu/provider/scheduling_provider.dart';
import 'package:kotaktemu/ui/home_page.dart';
import 'package:kotaktemu/ui/restaurant_detail_page.dart';
import 'package:kotaktemu/ui/restaurant_list_page.dart';
import 'package:kotaktemu/ui/search_page.dart';
import 'package:kotaktemu/ui/settings_page.dart';
import 'package:kotaktemu/ui/splash_screen_page.dart';
import 'package:kotaktemu/utils/background_service.dart';
import 'package:kotaktemu/utils/notification_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/navigation.dart';
import 'data/api/api_service.dart';
import 'data/db/database_helper.dart';
import 'data/model/restaurant.dart';
import 'data/preferences/preferences_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantsProvider>(
            create: (_) => RestaurantsProvider(apiService: ApiService()),
          ),
          ChangeNotifierProvider(create: (_) => SchedulingProvider()),
          ChangeNotifierProvider<PreferencesProvider>(
            create: (_) => PreferencesProvider(
              preferencesHelper: PreferencesHelper(
                sharedPreferences: SharedPreferences.getInstance(),
              ),
            ),
          ),
          ChangeNotifierProvider<DatabaseProvider>(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
          ),
        ],
        child:
            Consumer<PreferencesProvider>(builder: (context, provider, child) {
          return MaterialApp(
            title: 'Submission 3',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: provider.themeData,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomePage.routeName: (context) => HomePage(),
              RestaurantListPage.routeName: (context) => RestaurantListPage(),
              RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
                    restaurant: ModalRoute.of(context)?.settings.arguments
                        as Restaurant,
                  ),
              SettingsPage.routeName: (context) => SettingsPage(),
              SearchPage.routeName: (context) => SearchPage(),
            },
          );
        }));
  }
}
