import 'package:flutter/cupertino.dart';
import 'package:my_hotel/data/response/api_response.dart';
import 'package:my_hotel/model/coupon_model.dart';
import 'package:my_hotel/repository/Coupon/coupon_repository.dart';

class CouponViewModel extends ChangeNotifier {
  CouponRepository couponRepository;
  CouponViewModel({required this.couponRepository});
  bool couponHide = false;
  ApiResponse<CouponModel> coupon = ApiResponse.loading();
  ApiResponse<List<CouponModel>> couponListResponse = ApiResponse.loading();
  setCouponListResponse(ApiResponse<List<CouponModel>> response) {
    couponListResponse = response;
    notifyListeners();
  }

  setCoupon(ApiResponse<CouponModel> response) {
    coupon = response;
    notifyListeners();
  }

  setCouponHide(bool check) {
    couponHide = check;
    notifyListeners();
  }

  Future fetchCouponList() async {
    setCouponListResponse(ApiResponse.loading());
    couponRepository.fetchCouponList().then((value) {
      print("haha");
      List<dynamic> dt = value.data;
      List<CouponModel> areas = CouponModel.getListCoupon(dt);
      setCouponListResponse(ApiResponse.completed(areas));
    }).onError((error, stackTrace) {
      print("hihi");
      print(error.toString());
      setCouponListResponse(ApiResponse.error(error.toString()));
    });
  }

  void chooseCoupon(CouponModel couponModel) {
    coupon = ApiResponse.completed(couponModel);
    notifyListeners();
    setCouponHide(true);
  }
}
