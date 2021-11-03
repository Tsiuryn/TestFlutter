import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:test_flutter/screens/notification/notification_api.dart';

import '../../main.dart';

class NotificationPage extends StatefulWidget {
  static const id = 'NotificationPage';

  NotificationPage({Key key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {


  @override
  void initState()  {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('NotificationPage'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async{
            // _showProgressNotification();

            NotificationApi().showNotification(1, "title", "body", 10);
            // NotificationApi().showProgressNotification();


          },
          child: Text('Show notification'),
        ),
      ),
    );
  }
}
