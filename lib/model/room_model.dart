import 'package:my_hotel/model/type_room_model.dart';

class RoomModel {
  final int roomId;
  final int hotelId;
  final List<RoomTypeModel> roomTypes;
  final String roomName;
  final int roomAmountOfPeople;
  final int roomAcreage;
  final String roomView;
  final int roomStatus;

  RoomModel({
    required this.roomId,
    required this.hotelId,
    required this.roomTypes,
    required this.roomName,
    required this.roomAmountOfPeople,
    required this.roomAcreage,
    required this.roomView,
    required this.roomStatus,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> areaJsonList = json['roomTypes'] ?? [];
    List<RoomTypeModel> roomTypeList = areaJsonList
        .map((areaJson) => RoomTypeModel.fromJson(areaJson))
        .toList();
    return RoomModel(
      roomId: json['room_id'],
      hotelId: json['hotel_id'],
      roomTypes: roomTypeList,
      roomName: json['room_name'],
      roomAmountOfPeople: json['room_amount_of_people'],
      roomAcreage: json['room_acreage'],
      roomView: json['room_view'],
      roomStatus: json['room_status'],
    );
  }

  static List<RoomModel> getListHotel(List<dynamic> source) {
    List<RoomModel> hotelList =
        source.map((e) => RoomModel.fromJson(e)).toList();
    return hotelList;
  }
}
