import 'package:hive/hive.dart';
part 'database_manager.g.dart';

@HiveType(typeId: 0)
class SaveUserData extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String username;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late String email;
}
