import 'package:my_hotel/data/network/base_api_services.dart';
import 'package:my_hotel/data/network/network_api_services.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/repository/Hotel/hotel_repository.dart';

class HotelRepositoryImp implements HotelRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<ObjectDTO> fetchHotelByType(int index) async {
    try {
      ObjectDTO objectDTO = await _apiServices.getGetApiResponse(
          "${AppUrl.hoteListByType}?hotel_type=${index + 1}");
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> fetchHotelByArea(int index) async {
    try {
      ObjectDTO objectDTO = await _apiServices
          .getGetApiResponse("${AppUrl.hotelListByArea}?area_id=$index");
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> fetchHotelById(int index) async {
    try {
      ObjectDTO objectDTO = await _apiServices
          .getGetApiResponse(AppUrl.hotelById + "?hotel_id=$index");
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ObjectDTO> fetchHotelFavouriteId(Map<Object?, Object> data) async {
    try {
      ObjectDTO objectDTO =
          await _apiServices.getPostApiResponse(AppUrl.hotelFavourite, data);
      return objectDTO;
    } catch (e) {
      throw Exception(e);
    }
  }
}
