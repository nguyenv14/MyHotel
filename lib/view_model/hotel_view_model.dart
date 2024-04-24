import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_hotel/data/response/api_response.dart';
import 'package:my_hotel/model/hotel_model.dart';
import 'package:my_hotel/repository/Hotel/hotel_repository.dart';

class HotelViewModel extends ChangeNotifier {
  HotelRepository hotelRepository;
  HotelViewModel({required this.hotelRepository});

  ApiResponse<List<HotelModel>> hotelListByTypeResponse = ApiResponse.loading();
  ApiResponse<List<HotelModel>> hotelListByLocation = ApiResponse.loading();

  setHotelListByType(ApiResponse<List<HotelModel>> response) {
    hotelListByTypeResponse = response;
    notifyListeners();
  }

  setHotelListByLocation(ApiResponse<List<HotelModel>> response) {
    hotelListByLocation = response;
    notifyListeners();
  }

  Future fetchHotelListByType({int type = 0}) async {
    setHotelListByType(ApiResponse.loading());
    hotelRepository.fetchHotelByType(type).then((value) {
      List<dynamic> dt = value.data;
      List<HotelModel> hotels = HotelModel.getListHotel(dt);
      setHotelListByType(ApiResponse.completed(hotels));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setHotelListByType(ApiResponse.error(error.toString()));
    });
  }

  Future fetchHotelListByLocation(int index) async {
    setHotelListByLocation(ApiResponse.loading());
    hotelRepository.fetchHotelByArea(index).then((value) {
      List<dynamic> dt = value.data;
      List<HotelModel> hotels = HotelModel.getListHotel(dt);
      setHotelListByLocation(ApiResponse.completed(hotels));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setHotelListByLocation(ApiResponse.error(error.toString()));
    });
  }
}
