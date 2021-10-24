import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DownloadFilePage extends StatefulWidget {
  static const id = 'DownloadFilePage';

  const DownloadFilePage({Key key}) : super(key: key);

  @override
  _DownloadFilePageState createState() => _DownloadFilePageState();
}

class _DownloadFilePageState extends State<DownloadFilePage> {
  _DownloadFilePageState();
//
//   String groupKey = 'com.android.example.WORK_EMAIL';
//   String groupChannelId = 'grouped channel id';
//   String groupChannelName = 'grouped channel name';
//   String groupChannelDescription = 'grouped channel description';
//
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//
//   IOSInitializationSettings initializationSettingsIOS;
//
//   InitializationSettings initializationSettings;
//
//   @override
//   void initState() {
//     initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     androidPlatformChannelSpecifics = AndroidNotificationDetails(groupChannelId, groupChannelName,
//         channelDescription: groupChannelDescription, groupKey: groupKey, setAsGroupSummary: true);
//     platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//   }
//
//   AndroidNotificationDetails androidPlatformChannelSpecifics;
//
//   NotificationDetails platformChannelSpecifics;
//
//   void onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title),
//         content: Text(body),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {},
//           )
//         ],
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DownloadFilePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          MaterialButton(
              child: Text("Show notification"),
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              onPressed: () async {
                // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
                // flutterLocalNotificationsPlugin.show(22, 'Hello', 'Never give up', platformChannelSpecifics);
              }),
        ],
      ),
    );
  }
}
