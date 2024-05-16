import 'package:my_hotel/data/response/dto_object.dart';

abstract class CouponRepository {
  Future<ObjectDTO> fetchCouponList();
}
