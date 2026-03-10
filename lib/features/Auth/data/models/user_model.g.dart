// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 3;

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.readString(),
      phone: reader.readString(),
      yearsOfExp: reader.readString(),
      level: reader.readString(),
      address: reader.readString(),
      password: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.phone);
    writer.writeString(obj.yearsOfExp);
    writer.writeString(obj.level);
    writer.writeString(obj.address);
    writer.writeString(obj.password);
  }
}
