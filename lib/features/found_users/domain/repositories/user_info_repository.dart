import 'package:eventyle_app/features/found_users/domain/entities/user_info_entity.dart';

abstract class UserInfoRepository {
  Future<List<UserInfoEntity>> getAllUsers(String searchQuery);
}
