import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotiService {
  final notificationsFlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // initialize
  Future<void> initNotificaion() async {
    if (_isInitialized) return; // prevent re-init

    //init timezone handling
    // tz.initializeTimeZones();
    // final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // android
    const initSettingAndroid = AndroidInitializationSettings("@mipmap/ic_app");
    // ios

    const initSettings = InitializationSettings(
      android: initSettingAndroid,
    );

    // finally, init the flugin !
    await notificationsFlugin.initialize(initSettings);
  }
  // detail setup

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', "Daily Notifications",
            channelDescription: 'Daily Notification Channel',
            importance: Importance.max,
            priority: Priority.max));
  }

  // show notification
  Future<void> showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return notificationsFlugin.show(id, title, body, notificationDetails());
  }

  // Schedule
  Future<void> scheduleNotification(
      {int id = 1,
      required String title,
      required String body,
      required int hour,
      required int minute}) async {
    // get the current date/time in device's local timezone
    final now = tz.TZDateTime.now(tz.local);

    // create a date/time for today at the specified hour/min
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    // schedule notification
    await notificationsFlugin.zonedSchedule(
      id, title, body, scheduledDate, NotificationDetails(),
      // ios
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      //android
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

      // make notification repeat DAILY at same time
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // cancel all notification
  Future<void> cancelAllNotifications() async {
    await notificationsFlugin.cancelAll();
  }
}
