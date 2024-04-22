import 'package:my_hotel/model/area_model.dart';
import 'package:my_hotel/model/brand_model.dart';
import 'package:my_hotel/model/room_model.dart';

class HotelModel {
  final int hotelId;
  final String hotelName;
  final int hotelRank;
  final int hotelType;
  final int brandId;
  final BrandModel brand;
  // final int areaId;
  final List<RoomModel> rooms;
  final AreaModel areaModel;
  final String hotelPlaceDetails;
  final String hotelLinkPlace;
  final String hotelJfamePlace;
  final String hotelImage;
  final String hotelDesc;
  final String hotelTagKeyword;
  final int hotelView;
  final int hotelStatus;

  HotelModel({
    required this.hotelId,
    required this.hotelName,
    required this.hotelRank,
    required this.hotelType,
    required this.brandId,
    // required this.areaId,
    required this.brand,
    required this.rooms,
    required this.areaModel,
    required this.hotelPlaceDetails,
    required this.hotelLinkPlace,
    required this.hotelJfamePlace,
    required this.hotelImage,
    required this.hotelDesc,
    required this.hotelTagKeyword,
    required this.hotelView,
    required this.hotelStatus,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> areaJsonList = json['rooms'] ?? [];
    List<RoomModel> rooms =
        areaJsonList.map((areaJson) => RoomModel.fromJson(areaJson)).toList();
    final Map<String, dynamic> areaJson = json['area'] ?? {};
    final AreaModel areaModel = AreaModel.fromJson(areaJson);
    final Map<String, dynamic> brandJson = json['brand'] ?? {};
    final BrandModel brandModel = BrandModel.fromJson(brandJson);
    return HotelModel(
      hotelId: json['hotel_id'],
      hotelName: json['hotel_name'],
      hotelRank: json['hotel_rank'],
      hotelType: json['hotel_type'],
      brandId: json['brand_id'],
      brand: brandModel,
      rooms: rooms,
      areaModel: areaModel,
      hotelPlaceDetails: json['hotel_placedetails'],
      hotelLinkPlace: json['hotel_linkplace'],
      hotelJfamePlace: json['hotel_jfameplace'],
      hotelImage: json['hotel_image'],
      hotelDesc: json['hotel_desc'],
      hotelTagKeyword: json['hotel_tag_keyword'],
      hotelView: json['hotel_view'],
      hotelStatus: json['hotel_status'],
    );
  }

  static List<HotelModel> getListHotel(List<dynamic> source) {
    List<HotelModel> hotelList =
        source.map((e) => HotelModel.fromJson(e)).toList();
    return hotelList;
  }
}
