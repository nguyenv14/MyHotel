import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Area/area_repository.dart';

class AreaRepositoryImp implements AreaRepository {
  BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> fetchAreaList() async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getGetApiResponse(AppUrl.areaList);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }
}
