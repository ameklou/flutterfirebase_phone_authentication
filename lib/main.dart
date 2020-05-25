import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firebase Flutter Phone Authentication',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "main": (BuildContext context) => CustomSplashScreen(),
      },
      initialRoute: "main",
      debugShowCheckedModeBanner: false,
    );
  }
}
