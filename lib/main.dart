
import 'package:flutter/material.dart';

import 'download.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download File"),
      ),
      body: const Center(
        child: Text(
          'Download File',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const DownloadingDialog(),
          );
        },
        tooltip: 'Download File',
        child: const Icon(Icons.download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:percent_indicator_example/sample_circular_page.dart';
// import 'package:percent_indicator_example/sample_linear_page.dart';
//
// void main() {
//   runApp(MaterialApp(home: Scaffold(body: SamplePage())));
// }
//
// class SamplePage extends StatefulWidget {
//   @override
//   _SamplePageState createState() => _SamplePageState();
// }
//
// class _SamplePageState extends State<SamplePage> {
//   void _openPage(Widget page) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => page,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MaterialButton(
//               color: Colors.blueAccent,
//               child: Text("Circular Library"),
//               onPressed: () => _openPage(SampleCircularPage()),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20.0),
//             ),
//             // MaterialButton(
//             //   color: Colors.blueAccent,
//             //   child: Text("Linear Library"),
//             //   onPressed: () => _openPage(SampleLinearPage()),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
