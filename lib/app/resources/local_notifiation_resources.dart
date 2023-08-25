import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:io' as p;
import 'package:timezone/timezone.dart' as tz;

class ReceivedNotification {
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}

@pragma('vm:entry-point')
class LocalNotificationHelper {
  //Instances
  static final flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  String selectedNotificationPayload = '';
  static final BehaviorSubject<ReceivedNotification>
  didReceiveLocalNotificationSubject =
  BehaviorSubject<ReceivedNotification>();

  static final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();

  //Methods

  static Future<void> intialize() async {
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
    _requestPermissions();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (
            int? id,
            String? title,
            String? body,
            String? payload,
            ) async {
          didReceiveLocalNotificationSubject.add(
            ReceivedNotification(
              id: id!,
              title: title!,
              body: body!,
              payload: payload!,
            ),
          );
        });
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,);
  }

  static void _requestPermissions() async {
    var status = await Permission.notification.status;

    if (status.isDenied) {
      await Permission.notification.request();
    }
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled() ??
          false;


    }
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
      await androidImplementation?.requestPermission();

    }

  }

  static void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      print(receivedNotification.body);
    });
  }

  @pragma('vm:entry-point')
  static Future<void> showNotification(String title,String body,tz.TZDateTime scheduledDate,bool iswakeup) async {
    //print(message.data);
    await Firebase.initializeApp();
    //if (message.data["image"].toString().isNotEmpty) {
    //print(message.data["image"]);
    // const AndroidNotificationDetails androidPlatformChannelSpecifics =
    // AndroidNotificationDetails(
    //   'your alarm channel id',
    //   'your alarm channel name',
    //   channelDescription: 'your alarm channel description',
    //   importance: Importance.max,
    //   priority: Priority.high,
    // );
    // const NotificationDetails platformChannelSpecifics =
    // NotificationDetails(android: androidPlatformChannelSpecifics);
    //   await flutterLocalNotificationsPlugin.show(
    //     DateTime.now().millisecond,
    //     message.data["title"],
    //     message.data["body"],
    //     platformChannelSpecifics,
    //   );
    // Alarmplayer alarmplayer = Alarmplayer();
    // alarmplayer.Alarm(
    //   url: "assets/song/sound_one.mp3",
    //   volume: 0.3
    // );
    // await Future.delayed(Duration(seconds: 30));
    // alarmplayer.StopAlarm();
    // } else {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'wakie wakie',
      'wakie wakie',
      channelDescription: 'wakie wakie notification',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound('sound_one'),
      playSound: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
    );
    const DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails();
    // const NotificationDetails platformChannelSpecifics = NotificationDetails(
    //     android: androidPlatformChannelSpecifics,
    //     iOS: iosNotificationDetails);
    // await flutterLocalNotificationsPlugin.show(
    //   DateTime.now().millisecond,
    //   message.data["title"],
    //   message.data["body"],
    //   platformChannelSpecifics,
    //   payload: json.encode(message.data),
    // );
    //print("scheduledDateTime ${scheduledDate}");
    if(iswakeup){
      await flutterLocalNotificationsPlugin.zonedSchedule(
        11,
        title,
        body,
        scheduledDate,
        const NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iosNotificationDetails
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,);
    }else{
      await flutterLocalNotificationsPlugin.zonedSchedule(
        12,
        title,
        body,
        scheduledDate,
        const NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iosNotificationDetails
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,);
    }
    print("settttt");
    // }
  }

  @pragma('vm:entry-point')
  static Future<void> showNotificationSimple(RemoteMessage message) async {
    print("showNotificationSimple");
    await Firebase.initializeApp();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'the Call',
      'the call',
      channelDescription: 'the call notification',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
    );
    const DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      message.data["title"],
      message.data["body"],
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
  }

  // static Future<String> _downloadAndSaveFile(
  //     String url, String fileName) async {
  //   final p.Directory directory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${directory.path}/$fileName';
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  static void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      //await Navigator.pushNamed(context, '/secondPage');
    });
  }

  static void onSelectNotification(payload) async {
    var data = json.decode(payload);
    print(data);
  }

  static cancelNotififcationWithID(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static cancelAllNotififcation() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}
