import 'package:my_hotel/data/response/dto_object.dart';

abstract class BannerRepository {
  Future<ObjectDTO> fetchBannerList();
}
