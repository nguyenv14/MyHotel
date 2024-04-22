import 'package:my_hotel/data/response/dto_object.dart';

abstract class HotelRepository {
  Future<ObjectDTO> fetchHotelByType(int index);
}
