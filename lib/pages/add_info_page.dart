import 'package:flutter/material.dart';
import 'package:password_manager_v3/models/boxes.dart';
import 'package:password_manager_v3/models/database_manager.dart';
import 'package:password_manager_v3/widgets/widgets.dart';

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
            CustomTextFormField(context, _saveUserData, "title", false),
            CustomTextFormField(context, _saveUserData, 'username', false),
            CustomTextFormField(context, _saveUserData, 'password', true),
            CustomTextFormField(context, _saveUserData, 'email', false),
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
