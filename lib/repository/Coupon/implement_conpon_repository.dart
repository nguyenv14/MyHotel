import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Coupon/coupon_repository.dart';

class CouponRepositoryImp implements CouponRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> fetchCouponList() async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getGetApiResponse(AppUrl.couponList);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }
}
