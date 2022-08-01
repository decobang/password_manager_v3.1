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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Home'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  Icon(
                    Icons.fact_check,
                    size: 100,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(height: 24),
                  CustomTextFormField(context, _saveUserData, 'title', false),
                  SizedBox(height: 24),
                  CustomTextFormField(
                      context, _saveUserData, 'username', false),
                  SizedBox(height: 24),
                  CustomTextFormField(context, _saveUserData, 'password', true),
                  SizedBox(height: 24),
                  CustomTextFormField(context, _saveUserData, 'email', false),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: Colors.lightBlue,
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            box.add(_saveUserData);
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                      )
                    ],
                  )
                ])),
          ),
        ));
  }
}
