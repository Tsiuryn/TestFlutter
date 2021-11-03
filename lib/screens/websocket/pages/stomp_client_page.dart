import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:test_flutter/screens/websocket/pages/constants.dart';

class StompClientPage extends StatefulWidget {
  static const id = 'StompClientPage';
  const StompClientPage({Key? key}) : super(key: key);

  @override
  _StompClientPageState createState() => _StompClientPageState();
}

class _StompClientPageState extends State<StompClientPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }




}

void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/topic/test/subscription',
    callback: (frame) {
      List<dynamic> result = json.decode(frame.body ?? '');
      print(result);
    },
  );

  Timer.periodic(Duration(seconds: 10), (_) {
    stompClient.send(
      destination: '/app/test/endpoints',
      body: json.encode({'a': 123}),
    );
  });
}

final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://localhost:8080',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);

void main() {
  stompClient.activate();
}


