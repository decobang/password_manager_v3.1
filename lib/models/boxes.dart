import 'package:hive/hive.dart';
import 'package:password_manager_v3/models/database_manager.dart';

class Boxes {
  static Box<SaveUserData> getUserData() =>
      Hive.box<SaveUserData>('saved_data');
}
