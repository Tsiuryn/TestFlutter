import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/websocket/pages/stomp_client_page.dart';
import 'package:test_flutter/screens/websocket/pages/web_socket_channel_page.dart';

class WebSocketPage extends StatelessWidget {
  static const id = 'WebSocketPage';
  const WebSocketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocketPage'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                child: Text("web socket channel"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, WebSocketChannelPage.id);
                }),
            MaterialButton(
                child: Text("stomp client"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                onPressed: () {
                  Navigator.pushNamed(context, StompClientPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
