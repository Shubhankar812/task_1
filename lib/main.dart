import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  var linkText = TextStyle(color: Colors.blue);

  // Create an async function to handle URL launch
  Future<void> _launchURL() async {
    Uri url = Uri.parse("https://docs.flutter.dev");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Cannot load URL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 78),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "About Flutter",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Flutter is an open-source UI software development framework created by Google. It is designed for building natively compiled applications for mobile, web, and desktop from a single codebase.',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: ' Link to Flutter Docs',
                  recognizer: TapGestureRecognizer()..onTap = _launchURL,

                  style: TextStyle(color: const Color.fromARGB(255, 23, 135, 226))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
