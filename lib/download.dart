
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class DownloadingDialog extends StatefulWidget {
  const DownloadingDialog({Key? key}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  // void startDownloading() async {
  //   const String url =
  //       'https://firebasestorage.googleapis.com/v0/b/blog-app-bf28f.appspot.com/o/images%2FM1guMY3OcmSUdCXphw9cU72IXaz1_J4S54DBe8fOnd5XIVzJPof8oo6t1%2F1705926924294.jpg?alt=media&token=b4f8d7e6-4b59-408e-a934-5dd12d158429';
  //
  //   const String fileName = "TV.jpg";
  //
  //   String path = await _getFilePath(fileName);
  //
  //   print('path $path');
  //
  //   await dio.download(
  //     url,
  //     path,
  //     onReceiveProgress: (recivedBytes, totalBytes) {
  //       setState(() {
  //         progress = (recivedBytes / totalBytes).clamp(0.0, 1.0);
  //       });
  //
  //       print(progress);
  //     },
  //     deleteOnError: true,
  //   ).then((_) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: SnackBar(content: Text('Image save successfully'))));
  //     Navigator.pop(context);
  //   });
  // }

  void startDownloading() async {
    const String url =
        'https://firebasestorage.googleapis.com/v0/b/job-board-f6598.appspot.com/o/pictures%2Fcover_image%2FUkcK8QcmTwcpk6HIAjNqmVVHNdh2.jpg?alt=media&token=c747169f-5917-4a42-ad6e-3a45f96dc211';

    const String fileName = "images.jpg";

    String path = await _getFilePath(fileName);

    print('path $path');

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = (recivedBytes / totalBytes).clamp(0.0, 1.0);
        });
        print(progress);
      },
      deleteOnError: true,
    ).then((_) async {
      // Save the image to the gallery
      final result = await ImageGallerySaver.saveFile(path);
      print('Image saved to gallery: $result');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image save successfully')));
      // Close the dialog
      Navigator.pop(context);
    });
  }


  Future<String> _getFilePath(String filename) async {
    final dir = await getExternalStorageDirectory();
    return "${dir!.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const CircularProgressIndicator.adaptive(),
          CircularPercentIndicator(
            reverse: false,
            radius: 60.0,
            lineWidth: 13.0,
            animation: true,
            animationDuration: 3000,
            percent: progress,
            animateFromLastPercent: true,
            center: Text(
              "$downloadingprogress%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: const Text(
              "Downloading",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   "Downloading: $downloadingprogress%",
          //   style: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 17,
          //   ),
          // ),
        ],
      ),
    );
  }
}