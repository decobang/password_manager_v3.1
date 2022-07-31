import 'package:flutter/material.dart';
import 'package:password_manager_v3/models/database_manager.dart';

Widget CustomTextFormField(BuildContext context, SaveUserData _saveUserData,
    String type, bool required) {
  return TextFormField(
      style: TextStyle(color: Colors.black, letterSpacing: 1),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: type.toLowerCase().toString(),
        labelStyle: TextStyle(
          color: Colors.lightBlue,
        ),
      ),
      validator: (value) {
        if (required && value!.isEmpty) {
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
        return null;
      });
}
