import 'dart:ui';
import 'dart:isolate';

import 'package:kotaktemu/data/api/api_service.dart';

import '../main.dart';
import 'notification_helper.dart';

final ReceivePort port = ReceivePort();
 
class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;
 
  BackgroundService._internal() {
    _instance = this;
  }
 
  factory BackgroundService() => _instance ?? BackgroundService._internal();
 
  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }
 
  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();

    var result = await ApiService().listRestaurant();
    
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);
 
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}