import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager_v3/models/boxes.dart';
import 'package:password_manager_v3/models/database_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.pushReplacementNamed(context, '/');
            },
          ),
          title: Text('Login'),
        ),
        body: ValueListenableBuilder<Box<SaveUserData>>(
          valueListenable: Boxes.getUserData().listenable(),
          builder: (context, box, widget) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final item = box.getAt(index);
                return ListTile(
                  title: Text(item!.title),
                  subtitle: Text(item.username),
                  trailing: Text(item.password),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/add_info_page');
          },
          child: Icon(Icons.add),
        ));
  }
}
