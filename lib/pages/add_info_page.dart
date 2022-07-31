import 'package:flutter/material.dart';
import 'package:password_manager_v3/models/boxes.dart';
import 'package:password_manager_v3/models/database_manager.dart';

class AddInfoPage extends StatefulWidget {
  const AddInfoPage({Key? key}) : super(key: key);

  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final _saveUserData = SaveUserData();
  final box = Boxes.getUserData();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                labelText: 'title',
                labelStyle: TextStyle(
                    color: Colors.deepOrange,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                _saveUserData.title =
                    value == null || value.isEmpty ? 'Title' : value;
              },
            ),
            TextFormField(
              style: TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                labelText: 'username',
                labelStyle: TextStyle(
                    color: Colors.deepOrange,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                _saveUserData.username = value == null ? ' ' : value;
              },
            ),
            TextFormField(
              style: TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                labelText: 'password',
                labelStyle: TextStyle(
                    color: Colors.deepOrange,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required';
                } else {
                  _saveUserData.password = value;
                }
              },
            ),
            TextFormField(
              style: TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                labelText: 'email',
                labelStyle: TextStyle(
                    color: Colors.deepOrange,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                _saveUserData.email = value == null ? ' ' : value;
              },
            ),
            Row(
              children: <Widget>[
                Spacer(),
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      box.add(_saveUserData);
                      //await _saveUserData.save();
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  color: Colors.deepOrange,
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
