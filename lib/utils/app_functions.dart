import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_hotel/model/type_room_model.dart';

class AppFunctions {
  static String formatNumber(double number) {
    final formatter = NumberFormat("#,###", "en_US");
    String formatnumber = formatter.format(number);
    String formattedNumber = formatnumber.toString().replaceAll(',', '.');
    return formattedNumber;
  }

  static String calculatePrice(RoomTypeModel roomTypeModel) {
    double price_room = roomTypeModel.typeRoomPrice -
        (roomTypeModel.typeRoomPrice / 100) * roomTypeModel.typeRoomPriceSale;
    return formatNumber(price_room);
  }
}
