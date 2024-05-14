import 'package:hive_flutter/hive_flutter.dart';

part 'user_dto.g.dart';

@HiveType(typeId: 0)
class UserStorageDB extends HiveObject {
  @HiveField(0)
  String uuid;

  UserStorageDB({
    required this.uuid,
  });

  UserStorageDB copyWith({
    String? uuid,
  }) =>
      UserStorageDB(
        uuid: uuid ?? this.uuid,
      );
}
