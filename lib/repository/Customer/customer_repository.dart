import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/model/customer_model.dart';

abstract class CustomerRepository {
  Future<ObjectDTO> updateUser(Map<Object?, Object> data);
}
