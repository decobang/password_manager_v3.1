import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager_v3/pages/add_info_page.dart';
import 'package:password_manager_v3/pages/home_page.dart';
import 'package:password_manager_v3/models/database_manager.dart';

void main() async {
  // initialize hive database
  await Hive.initFlutter();

  // register dapter for SaveUserData
  Hive.registerAdapter(SaveUserDataAdapter());

  await Hive.openBox<SaveUserData>('saved_data');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void onDispose() async {
    await Hive.box('saved_data').close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add_info_page': (context) => AddInfoPage(),
      },
    );
  }
}
