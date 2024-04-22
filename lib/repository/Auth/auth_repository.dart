import 'package:my_hotel/data/response/dto_object.dart';

abstract class AuthRepository {
  Future<ObjectDTO> checkLogin(Map<Object?, Object> data);
}
