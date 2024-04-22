import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Auth/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> checkLogin(Map<Object?, Object> data) async {
    ObjectDTO response =
        await _apiServices.getPostApiResponse(AppUrl.CheckLogin, data);
    return response;
  }
}
