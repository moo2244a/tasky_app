import 'package:tasky_app/features/Auth/data/models/user_model.dart';

class FindUserByPhone {
  User? call(List<User> users, String phoneUser) {
    final trimmedPhone = phoneUser.trim();
    if (trimmedPhone.isEmpty) return null;

    try {
      return users.firstWhere((user) => user.phone.trim() == trimmedPhone);
    } catch (e) {
      return null;
    }
  }
}
