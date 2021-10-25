import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:test_flutter/screens/download_file/list_directories.dart';

class DownloadFilePage extends StatefulWidget {
  static const id = 'DownloadFilePage';

  const DownloadFilePage({Key key}) : super(key: key);

  @override
  _DownloadFilePageState createState() => _DownloadFilePageState();
}

class _DownloadFilePageState extends State<DownloadFilePage> {

  final imgUrl =
      "https://www.businessstudio.ru/publication/proizv_predpr_abc/download.php?lang=ru-ru&oguid=a6fe90cc-11a2-41d0-b03c-c5aff5c5abb3&rguid=b7566ce6-b51d-4f2b-b9da-e208118e8e0e&ext=pdf";
  var dio = Dio();
  List <String> filePath = [];

  String _getName(){
    var now = DateTime.now();
    return DateFormat('dd_MM_yy HH_mm_ss').format(now);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
                onPressed: () async {
                  if(await _checkPermission(context)){
                    var tempDir;
                    if(Platform.isIOS){
                      tempDir = await path_provider.getApplicationDocumentsDirectory();
                    }else{
                      tempDir = await path_provider.getExternalStorageDirectory();
                    }
                    setState(() {
                      filePath.add(tempDir.path + "/${_getName()}.pdf");
                    });

                    print('full path ${filePath}');

                    download2(dio, imgUrl, filePath[0]);
                  }

                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                color: Colors.green,
                textColor: Colors.white,
                label: Text('Dowload Invoice')),
            TextButton(child: Text('to List Files'),onPressed: (){
              Navigator.pushNamed(context, ListFiles.id);
            }),
            IconButton(onPressed: filePath.isEmpty? null : () async{
              await _onShare(context);
            }, icon: Icon(Icons.share)),
          ],
        ),
      ),

    );
  }
  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //

    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject() as RenderBox;
     await Share.shareFiles(
         filePath,
          subject: 'Share',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  Future<bool> _checkPermission(BuildContext context) async {
    var firstStatus = await Permission.storage.status;
    if (firstStatus.isDenied) {
      var status = await Permission.storage.request();
      if (status.isDenied) {
        await showAlarmDialog(context);
      }
      return false;

    } else {
      return true;
    }
  }

  void showAlarmDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Permission'),
              content: Text('We need to download file and write to your device'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      if(await _checkPermission(context)){
                        var tempDir = await path_provider.getExternalStorageDirectory();
                        String fullPath = tempDir.path + "/boo2.pdf";
                        print('full path ${fullPath}');

                        download2(dio, imgUrl, fullPath);
                      }
                    },
                    child: Text('Ok')),
              ],
            ));
  }
}
