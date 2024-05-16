import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Banner/banner_repository.dart';

class BannerRepositoryImp implements BannerRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future<ObjectDTO> fetchBannerList() async {
    ObjectDTO objectDTO =
        await _apiServices.getGetApiResponse(AppUrl.bannerList);
    return objectDTO;
  }
}
