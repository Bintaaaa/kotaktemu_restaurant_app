import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/provider/preferences_provider.dart';
import 'package:kotaktemu/provider/scheduling_provider.dart';
import 'package:kotaktemu/widgets/popup_dialog.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static final routeName = '/settings_screen';
  static const String settingsTitle = 'Settings';

  Widget _buildList(BuildContext context) {
    return Consumer<PreferencesProvider>(builder: (context, provider, child) {
      return ListView(
        children: [
          Material(
            child: ListTile(
              title: Text('Dark Theme'),
              hoverColor: primaryColor,
              trailing: Switch.adaptive(
                value: provider.isDarkTheme,
                onChanged: (value) {
                  provider.enableDarkTheme(value);
                },
              ),
            ),
          ),
          Material(
            child: ListTile(
              title: Text('Alarm Restaurant'),
              hoverColor: primaryColor,
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: provider.isDailyRestaurantActive,
                    onChanged: (value) async {
                      if (Platform.isIOS) {
                        popupDialog(context);
                      } else {
                        scheduled.isScheduleRestaurant(value);
                        provider.enableDailyRestaurant(value);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }
}
