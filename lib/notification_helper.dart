// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../main.dart';

// @pragma('vm:entry-point')
// void onNotificationTapBackground(
//     NotificationResponse notificationResponse) async {
//   // handle action

//   //  Map payload = json.decode(notificationResponse.payload!);
//   // push(const ProgressScreen());
// }

// class NotificationHelper {
//   static Future<void> initialize(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     // final isPlatformDark =
//     //     WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
//     // var androidInitialize = AndroidInitializationSettings(isPlatformDark
//     //     ? 'img_notification_icon_light'
//     //     : 'img_notification_icon_dark');
//     var androidInitialize =
//         const AndroidInitializationSettings('img_notification_icon');
//     var iOSInitialize = const DarwinInitializationSettings();
//     var initializationsSettings =
//         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationsSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {
//         Map payload = json.decode(notificationResponse.payload!);
//       },
//       onDidReceiveBackgroundNotificationResponse: onNotificationTapBackground,
//       //     onSelectNotification: (String? payload) async {
//       //   try {
//       //     if (payload != null && payload.isNotEmpty) {
//       //       // MyApp.navigatorKey.currentState!.push(
//       //       //     MaterialPageRoute(builder: (context) => FriendsChallenge()));

//       //       ///OrderDetailsScreen(orderModel: null, orderId: int.parse(payload))));
//       //     }
//       //   } catch (e) {}
//       //   return;
//       // }
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //  console("onMessage: ${message.data['title']}/${message.data['body']}");
//       showNotification(message, flutterLocalNotificationsPlugin, true);
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       //    console(
//       //       "onMessageOpenedApp: ${message.data['title']}/${message.data['body']}");
//       try {
//         if (message.notification?.titleLocKey != null &&
//             message.notification!.titleLocKey!.isNotEmpty) {
//           // MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
//           //     builder: (context) => const FriendsChallenge()));
//         }
//       } catch (e) {
//         // console(e);
//       }
//     });
//   }

//   static Future<void> showNotification(RemoteMessage message,
//       FlutterLocalNotificationsPlugin fln, bool data) async {
//     String title;
//     String body;
//     String orderID;
//     // String image;
//     if (data) {
//       title = message.data['title'];
//       body = message.data['body'];
//       if (message.data['type'] == 'goal') {
//         orderID = json.encode({
//           'generatedTime': message.data['generatedTime'],
//           'type': message.data['type']
//         });
//       } else {
//         orderID = json.encode({'type': message.data['type']});
//       }
//       // message.data['order_id'];
//       // _image = (message.data['image'] != null && message.data['image'].isNotEmpty)
//       //     ? message.data['image'].startsWith('http') ? message.data['image']
//       //     : '${ApiServices.baseurl}/storage/app/public/notification/${message.data['image']}' : null;
//     } else {
//       title = message.notification!.title!;
//       body = message.notification!.body!;
//       orderID = 'ff'; // message.notification!.titleLocKey!;
//       // if(Platform.isAndroid) {
//       //   // String d=message.notification?.android?.imageUrl??'';
//       //   _image = ((message.notification?.android?.imageUrl != null && (message.notification!.android?.imageUrl??'').isNotEmpty)
//       //       ? (message.notification?.android?.imageUrl??'').startsWith('http') ? message.notification?.android?.imageUrl??''
//       //       : '${ApiServices.baseurl}/storage/app/public/notification/${message.notification?.android?.imageUrl??''}' : null)!;
//       // }else if(Platform.isIOS) {
//       //   _image = ((message.notification?.apple?.imageUrl != null && (message.notification?.apple?.imageUrl??'').isNotEmpty)
//       //       ? (message.notification?.apple?.imageUrl??'').startsWith('http') ? message.notification?.apple?.imageUrl
//       //       : '${ApiServices.baseurl}/storage/app/public/notification/${message.notification?.apple?.imageUrl}' : null)!;
//       // }
//     }

//     // if(_image != null && _image.isNotEmpty) {
//     //   try{
//     //     await showBigPictureNotificationHiddenLargeIcon(_title, _body, _orderID, _image, fln);
//     //   }catch(e) {
//     //     await showBigTextNotification(_title, _body, _orderID, fln);
//     //   }
//     // }else {
//     await showBigTextNotification(title, body, orderID, fln);
//     // }
//   }

//   static Future<void> showTextNotification(String title, String body,
//       String orderID, FlutterLocalNotificationsPlugin fln) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'Challenge Notification', 'Oengoo Notification',
//       channelDescription: 'your channel description', playSound: false,
//       importance: Importance.max, priority: Priority.max,
//       // sound: RawResourceAndroidNotificationSound('notification'),
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
//   }

//   static Future<void> showBigTextNotification(String title, String body,
//       String orderID, FlutterLocalNotificationsPlugin fln) async {
//     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//         body,
//         htmlFormatBigText: true,
//         contentTitle: title,
//         htmlFormatContentTitle: true);
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id', 'Oengoo Notification',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       styleInformation: bigTextStyleInformation,
//       priority: Priority.max,
//       playSound: false,

//       // sound:const RawResourceAndroidNotificationSound('notification'),
//     );
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
//   }

//   // static Future<void> showBigPictureNotificationHiddenLargeIcon(String title, String body, String orderID, String image, FlutterLocalNotificationsPlugin fln) async {
//   //   final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
//   //   final String bigPicturePath = await _downloadAndSaveFile(image, 'bigPicture');
//   //   final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
//   //     FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
//   //     contentTitle: title, htmlFormatContentTitle: true,
//   //     summaryText: body, htmlFormatSummaryText: true,
//   //   );
//   //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //     'your channel id', 'your channel name',channelDescription: 'your channel description',
//   //     largeIcon: FilePathAndroidBitmap(largeIconPath), priority: Priority.max, playSound: true,
//   //     styleInformation: bigPictureStyleInformation, importance: Importance.max,
//   //     sound: RawResourceAndroidNotificationSound('notification'),
//   //   );
//   //   final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//   //   await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
//   // }

//   // static Future<String> _downloadAndSaveFile(String url, String fileName) async {
//   //   final Directory directory = await getApplicationDocumentsDirectory();
//   //   final String filePath = '${directory.path}/$fileName';
//   //   final Response response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
//   //   final File file = File(filePath);
//   //   await file.writeAsBytes(response.data);
//   //   return filePath;
//   // }
// }

// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   debugPrint(
//       "myBackgroundMessageHandler: ${message.data['title']}/${message.data['body']}");
//   NotificationHelper.showNotification(
//       message, flutterLocalNotificationsPlugin, true);
// }
