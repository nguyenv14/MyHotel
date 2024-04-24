import 'package:flutter/cupertino.dart';
import 'package:my_hotel/data/response/api_response.dart';
import 'package:my_hotel/model/area_model.dart';
import 'package:my_hotel/repository/Area/area_repository.dart';

class AreaViewModel extends ChangeNotifier {
  AreaRepository areaRepository;
  AreaViewModel({required this.areaRepository});

  ApiResponse<List<AreaModel>> areaListResponse = ApiResponse.loading();
  setAreaListResponse(ApiResponse<List<AreaModel>> response) {
    areaListResponse = response;
    notifyListeners();
  }

  Future fetchAreaList() async {
    setAreaListResponse(ApiResponse.loading());
    areaRepository.fetchAreaList().then((value) {
      List<dynamic> dt = value.data;
      List<AreaModel> areas = AreaModel.getListAreaModel(dt);
      setAreaListResponse(ApiResponse.completed(areas));
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
