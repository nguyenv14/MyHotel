import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Order/order_repository.dart';

class OrderRepositoryImp implements OrderRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> getListOrderByStatus(
      int customer_id, int order_status) async {
    try {
      ObjectDTO objectDTO = await _apiServices.getGetApiResponse(
          AppUrl.orderListByStatus +
              "?customer_id=" +
              customer_id.toString() +
              "&order_status=" +
              order_status.toString());
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> cancelOrderByCustomer(Map<Object?, Object> data) async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getPostApiResponse(AppUrl.cancelOrderById, data);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> sendCommentToOrder(Map<Object?, Object> data) async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getPostApiResponse(AppUrl.sendCommentOrder, data);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> checkout(Map<Object?, Object> data) async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getPostApiResponse(AppUrl.checkOut, data);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }
}
