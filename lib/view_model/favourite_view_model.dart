import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_hotel/data/response/api_response.dart';
import 'package:my_hotel/model/hotel_model.dart';
import 'package:my_hotel/model/list_id_model.dart';
import 'package:my_hotel/repository/Hotel/hotel_repository.dart';
import 'package:my_hotel/utils/favorite_db.dart';

class FavouriteViewModel extends ChangeNotifier {
  final HotelRepository hotelRepository;
  List<FavouriteModel> favouriteList = [];
  List<HotelModel> hotelModels = [];
  FavouriteViewModel({required this.hotelRepository}) {
    favouriteList = FavouriteDB.getListUserFee();
    fetchFavouriteList();
  }

  ApiResponse<List<HotelModel>> favouriteViewModel = ApiResponse.loading();

  void setFavouriteResponseModel(ApiResponse<List<HotelModel>> apiResponse) {
    favouriteViewModel = apiResponse;
    notifyListeners();
  }

  void addFavouriteId(int id) {
    FavouriteDB.saveFavoriteId(id);
    favouriteList = FavouriteDB.getListUserFee();
    fetchFavouriteList();
    print(favouriteList.length);
    notifyListeners();
  }

  bool checkFavouriteId(int id) {
    return favouriteList.any((favourite) => favourite.hotel_id == id);
  }

  void deleteFavouriteId(int id) {
    FavouriteDB.deleteFavouriteId(id);
    favouriteList = FavouriteDB.getListUserFee();
    fetchFavouriteList();
    print(favouriteList.length.toString() + "haha");
    notifyListeners();
  }

  Future fetchFavouriteList() async {
    setFavouriteResponseModel(ApiResponse.loading());
    var body = {
      "favourites": jsonEncode(favouriteList),
    };
    hotelRepository.fetchHotelFavouriteId(body).then((value) {
      if (value.statusCode == 200) {
        List<dynamic> dt = value.data;
        List<HotelModel> hotels = HotelModel.getListHotel(dt);
        setFavouriteResponseModel(ApiResponse.completed(hotels));
      } else {
        setFavouriteResponseModel(
            ApiResponse.error("không load được dữ liệu!"));
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
