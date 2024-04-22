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

  ApiResponse<List<HotelModel>> hotelListResponse = ApiResponse.loading();

  setHotelList(ApiResponse<List<HotelModel>> response) {
    hotelListResponse = response;
    notifyListeners();
  }

  Future fetchHotelListByType({int type = 0}) async {
    setHotelList(ApiResponse.loading());
    hotelRepository.fetchHotelByType(type).then((value) {
      List<dynamic> dt = value.data;
      List<HotelModel> hotels = HotelModel.getListHotel(dt);
      setHotelList(ApiResponse.completed(hotels));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setHotelList(ApiResponse.error(error.toString()));
    });
  }
}
