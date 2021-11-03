import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

class DownloadFileByLibPage extends StatefulWidget {
  static const id = 'DownloadFileByLibPage';

  const DownloadFileByLibPage({Key? key}) : super(key: key);

  @override
  _DownloadFileByLibPageState createState() => _DownloadFileByLibPageState();
}

class _DownloadFileByLibPageState extends State<DownloadFileByLibPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DownloadFileByLibPage'),
        ),
        body: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              OutlinedButton.icon(
                onPressed: () async {
                  if (Platform.isAndroid) {
                    final status = await Permission.storage.request();
                    final directory = await path_provider.getExternalStorageDirectory();
                    if (status.isGranted) {
                      // var id = await _downloadFile(directory);
                      final downloaderUtils = DownloaderUtils(
                        progressCallback: (current, total) {
                          final progress = (current / total) * 100;
                          print('Downloading: $progress');
                        },
                        client: Dio(),
                        file: File('${directory?.path}/200MB.zip'),
                        progress: ProgressImplementation(),
                        onDone: () => print('Download done'),
                        deleteOnCancel: true,
                      );

                      final core = await Flowder.download(
                          'http://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf',
                          downloaderUtils);
                    } else {
                      print('Permission is denied');
                    }
                  } else {
                    final status = await Permission.storage.request();
                    if (status.isGranted) {
                      var directory = await path_provider.getExternalStorageDirectory();
                      var id = await FlutterDownloader.enqueue(
                          url:
                              "https://www.businessstudio.ru/publication/proizv_predpr_abc/download.php?lang=ru-ru&oguid=a6fe90cc-11a2-41d0-b03c-c5aff5c5abb3&rguid=b7566ce6-b51d-4f2b-b9da-e208118e8e0e&ext=pdf",
                          savedDir: directory!.path,
                          fileName: 'File.pdf',
                          showNotification: true,
                          openFileFromNotification: false);
                    }
                  }
                },
                label: Text('download file'),
                icon: Icon(Icons.download),
              ),
            ],
          ),
        ));
  }

}
