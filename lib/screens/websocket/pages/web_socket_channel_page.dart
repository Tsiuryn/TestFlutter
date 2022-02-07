import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/websocket/pages/constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketChannelPage extends StatefulWidget {
  static const id = 'WebSocketChannelPage';
  const WebSocketChannelPage({Key? key}) : super(key: key);

  @override
  _WebSocketChannelPageState createState() => _WebSocketChannelPageState();
}

class _WebSocketChannelPageState extends State<WebSocketChannelPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Web Socket Demo'),
        ),
        body: WebSocketDemo(),
      ),
    );
  }
}

class WebSocketDemo extends StatefulWidget {

  //For test https://www.piesocket.com/websocket-tester#
  final WebSocketChannel channel =
  IOWebSocketChannel.connect
    (socket_url);

  @override
  _WebSocketDemoState createState() => _WebSocketDemoState(channel: channel);
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  final WebSocketChannel channel;
  final inputController = TextEditingController();
  List<String> messageList = [];

  _WebSocketDemoState({required this.channel}) {
    channel.stream.listen((data) {
      setState(() {
        messageList.add(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      labelText: 'Send Message',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        print(inputController.text);
                        channel.sink.add(inputController.text);
                      }
                      inputController.text = '';
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: getMessageList(),
          ),
//          Expanded(
//            child: StreamBuilder(
//              stream: channel.stream,
//              builder: (context, snapshot) {
//                if (snapshot.hasData) {
//                  messageList.add(snapshot.data);
//                }
//
//                return getMessageList();
//              },
//            ),
//          ),
        ],
      ),
    );
  }

  ListView getMessageList() {
    List<Widget> listWidget = [];

    for (String message in messageList) {
      listWidget.add(ListTile(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              softWrap: true,
              style: TextStyle(fontSize: 22),
            ),
          ),
          color: Colors.teal[50],
        ),
      ));
    }

    return ListView(children: listWidget);
  }

  @override
  void dispose() {
    inputController.dispose();
    widget.channel.sink.close();
    super.dispose();
  }
}
