import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import "package:mymusicapp/home_view.dart";

void main() => runApp(
      DevicePreview(
        enabled: true,
        // ignore: prefer_const_constructors
        builder: (context) => MyApp(), // Wrap your app
      ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Contact App",
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
