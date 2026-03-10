import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 3)
class User extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String yearsOfExp;

  @HiveField(3)
  String level;

  @HiveField(4)
  String address;

  @HiveField(5)
  String password;

  User({
    required this.name,
    required this.phone,
    required this.yearsOfExp,
    required this.level,
    required this.address,
    required this.password,
  });
}
