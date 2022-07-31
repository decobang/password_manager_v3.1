import 'package:flutter/material.dart';
import 'package:password_manager_v3/models/database_manager.dart';

Widget CustomTextFormField(BuildContext context, SaveUserData _saveUserData,
    String type, bool required) {
  return TextFormField(
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
        labelText: type.toLowerCase().toString(),
        labelStyle: TextStyle(
            color: Colors.deepOrange,
            letterSpacing: 1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (required && value == null) {
          return 'required';
        } else {
          if (type == 'title') {
            _saveUserData.title =
                value == null || value.isEmpty ? 'Title' : value;
          } else if (type == 'username') {
            _saveUserData.username = value == null ? '' : value;
          } else if (type == 'password') {
            _saveUserData.password = value as String;
          } else if (type == 'email') {
            _saveUserData.email = value == null ? '' : value;
          }
        }
      });
}
