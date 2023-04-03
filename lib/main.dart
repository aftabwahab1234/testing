// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
//   // See related issue: https://github.com/flutter/flutter/issues/96391

//   await Firebase.initializeApp(

//       // options: DefaultFirebaseOptions.currentPlatform,
//       );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 50,
//             ),
//             InkWell(
//               onTap: () async {
//                 //print("button here");

//                 UserCredential data = await FirebaseAuth.instance
//                     .signInWithEmailAndPassword(
//                         email: "aftab@gmail.com", password: "password")
//                     //  gWc28O2cVRR3iDQHaiJ7j58Pfqq2
//                     .whenComplete(() {
//                   print("logined");
//                 });

//                 // var token =
//                 //     await FirebaseAuth.instance.currentUser!.getIdToken();
//                 // String? token1 =
//                 //     await FirebaseMessaging.instance.getAPNSToken();
//                 await FirebaseMessaging.instance.getToken().then((value) {
//                   print(value);
//                 });
//                 //  print(token1);

//                 // print(token);
//               },
//               child: Text(
//                 'Login user',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () async {
//                 await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc()
//                     .set({'name': "aftab khan", "age": 25});
//                 //print("button here");
//               },
//               child: Text(
//                 'Send data',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () async {
//                 var data = await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc('IX4lJd9cwRzMj2gtnqKL')
//                     .get();
//                 print(data.get('name'));

//                 //print("button here");
//               },
//               child: Text(
//                 'Get data',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () async {
//                 await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc('IX4lJd9cwRzMj2gtnqKL')
//                     .update({
//                   'name': 'usman khan updatedddd',
//                   'age': 25,
//                 });

//                 //print("button here");
//               },
//               child: Text(
//                 'Update data',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () async {
//                 await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc('IX4lJd9cwRzMj2gtnqKL')
//                     .delete();

//                 //print("button here");
//               },
//               child: Text(
//                 'Delete data',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () async {
//                 Reference ref = FirebaseStorage.instance.ref().child('pics');
//                 TaskSnapshot data = await ref.putString("testing data");
//                 ref.getDownloadURL().then((value) {
//                   print(value);
//                 });
//                 // await ref.p

//                 //print("button here");
//               },
//               child: Text(
//                 'Upload data',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             Container(
//               height: 20,
//             ),
//             StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .where('age', isGreaterThan: 20)
//                     .snapshots(),
//                 builder: ((BuildContext context,
//                     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                         snapshot) {
//                   print("$snapshot");

//                   if (snapshot.hasData) {
//                     List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
//                         snapshot.data!.docs;
//                     return Container(
//                       height: 300,
//                       width: 300,
//                       color: Colors.red,
//                       child: ListView.builder(
//                           itemCount: data.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 30,
//                                 width: 200,
//                                 color: Colors.amberAccent,
//                                 child: Center(
//                                     child: Text(
//                                         "${data[index].get('name').toString().substring(0, 1).toUpperCase() + data[index].get('name').toString().substring(1, data[index].get('name').toString().length)} " +
//                                             " ${data[index].get('age')}")),
//                               ),
//                             );
//                           }),
//                     );
//                   }
//                   return const CircularProgressIndicator();
//                 }))
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'notification_helper.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// void main() async {
//   await NotificationHelper.initialize(flutterLocalNotificationsPlugin);

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'testing',
//       home: Homepage(),
//     );
//   }
// }

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// //import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> initialize(
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//   var androidInitialize = const AndroidInitializationSettings('ic_launcher');
//   var iOSInitialize = const DarwinInitializationSettings();
//   var initializationsSettings =
//       InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//   flutterLocalNotificationsPlugin.initialize(
//     initializationsSettings,
//   );
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Get a location using getDatabasesPath
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath, 'demo.db');

// // Delete the database
//   //await deleteDatabase(path);
//   Database db = await openDatabase(
//     path,
//     version: 1,
//   );
//   // await db.transaction((txn) async {
//   //   int id1 = await txn.rawInsert(
//   //       'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//   //   print('inserted1: $id1');
//   //   int id2 = await txn.rawInsert(
//   //       'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//   //       ['another name', 12345678, 3.1416]);
//   //   print('inserted2: $id2');
//   // });
//   //Insert the data

//   await db.rawInsert(
//       'INSERT INTO Test(name, value, num) VALUES("aftab wahab", 1234, 456.789)');
//   await db
//       .insert("Test", {"name": "aftab khan", "value": "testing", "num": 50});

//   //Get the data
//   List<Map> list = await db.rawQuery('SELECT * FROM Test');

//   print(list);

//   db.close();
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               InkWell(
//                 onTap: () async {
//                   await showTextNotification("testingid", "testingbody",
//                           "orderid", flutterLocalNotificationsPlugin)
//                       .catchError((e) {
//                     print(e);
//                   });
//                 },
//                 child: const Text('Show Notification With Sound'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
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

//   // Future onSelectNotification(String payload) async {
//   //   showDialog(
//   //     context: context,
//   //     builder: (_) {
//   //       return new AlertDialog(
//   //         title: Text("PayLoad"),
//   //         content: Text("Payload : $payload"),
//   //       );
//   //     },
//   //   );
//   // }
// }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart' show rootBundle;

// void main() {
//   runApp(const MaterialApp(
//     title: 'Testing',
//     home: Filehandling(),
//   ));
// }

// class Filehandling extends StatefulWidget {
//   const Filehandling({Key? key}) : super(key: key);

//   @override
//   State<Filehandling> createState() => _FilehandlingState();
// }

// class _FilehandlingState extends State<Filehandling> {
//   Future<String> loadAsset() async {
//     return await rootBundle.loadString('assets/data.txt');
//   }

//   Future<String> getlocalpath() async {
//     Directory path = await getApplicationDocumentsDirectory();
//     return path.path;
//   }

//   Future<File> createfile() async {
//     final localfile = await getlocalpath();
//     File file = File('$localfile/data2.txt');
//     return file.create();
//   }

//   Future<File> getlocalfile() async {
//     final localfile = await getlocalpath();
//     return File('$localfile/data1.txt');
//     // return file.create();
//   }

//   Future<String> readfile() async {
//     try {
//       final file = await getlocalfile();
//       String contents = await file.readAsString();
//       print("$contents");
//       return contents;
//     } catch (e) {
//       print("readfile error is $e");
//       return "";
//     }
//   }

//   Future<File> writefile(String data) async {
//     final file = await getlocalfile();
//     //File file = File('$localfile/data1.txt');

//     // Write the file
//     return file.writeAsString('$data');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 410,
//         height: 900,
//         color: Colors.amberAccent,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () async {
//                 await getlocalpath().catchError((e) {
//                   print(e);
//                 });
//               },
//               child: Text('get path'),
//             ),
//             Container(
//               height: 50,
//             ),
//             InkWell(
//               onTap: () async {
//                 await createfile().catchError((e) {
//                   print(e);
//                 });
//               },
//               child: Text('create file'),
//             ),
//             Container(
//               height: 50,
//             ),
//             InkWell(
//               onTap: () async {
//                 await getlocalfile().catchError((e) {
//                   print(e);
//                 });
//               },
//               child: Text('get local'),
//             ),
//             Container(
//               height: 50,
//             ),
//             InkWell(
//               onTap: () async {
//                 await writefile(
//                         "aftab wahab app developer. \n Having experience of almost 4 years in flutter.testing")
//                     .catchError((e) {
//                   print(e);
//                 });
//               },
//               child: Text('write data'),
//             ),
//             Container(
//               height: 50,
//             ),
//             InkWell(
//               onTap: () async {
//                 await readfile();
//                 // await loadAsset().then((value) {
//                 //   print("value \n$value");
//                 // });
//               },
//               child: Text('read file'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebasetesting/sample.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MapSample(
      latitude: 36.456410,
      longitude: 10.729790,
    )
        // Scaffold(
        //     appBar: AppBar(
        //       title: const Text('Maps Sample App'),
        //       backgroundColor: Colors.green[700],
        //     ),
        //  body:
        //Center(
        // child: Column(
        //   children: [
        //     Container(
        //         color: Colors.red,
        //         height: 50,
        //         width: 100,
        //         child: Center(child: Text("1"))),
        //     Container(height: 50, child: Text("2")),
        //     Container(height: 50, child: Text("3")),
        //   ],
        // ),

        // child:
        // Container(
        //   width: 200,
        //   height: 50,
        //   color: Colors.amberAccent,
        //   child: InkWell(
        //     onTap: () async {
        //       Position position = await Geolocator.getCurrentPosition(
        //           desiredAccuracy: LocationAccuracy.high);
        //       print("position.latitude ${position.latitude}");
        //       print("position.longitude ${position.longitude}");

        //       // await Geolocator.getLocationAccuracy().catchError((e) {
        //       //   print(e);
        //       // }).whenComplete(() => print("completed"));
        //       // await Geolocator.isLocationServiceEnabled();
        //       // await _determinePosition().then((value) {
        //       //   print(value);
        //       // });
        //       // await Geolocator.getCurrentPosition().then((value) {
        //       //   print(value.latitude);
        //       // });
        //     },
        //     child: const Center(child: Text("Get position")),
        //   ),
        // ),
        //  )
        // GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(
        //     target: _center,
        //     zoom: 11.0,
        //   ),
        // ),
        //    ),
        );
  }
}
