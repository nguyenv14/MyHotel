import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/model/customer_model.dart';
import 'package:my_hotel/repository/Customer/customer_repository.dart';

class CustomerRepositoryImp implements CustomerRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> updateUser(Map<Object?, Object> data) async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getPostApiResponse(AppUrl.updateCustomer, data);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }
}
