import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/configs/text_style.dart';
import 'package:my_hotel/data/response/status.dart';
import 'package:my_hotel/main.dart';
import 'package:my_hotel/utils/user_db.dart';
import 'package:my_hotel/view/myorder/components/order_component.dart';
import 'package:my_hotel/view/product/components/line_component.dart';
import 'package:my_hotel/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({super.key});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderViewModel>(
      create: (context) => OrderViewModel(orderRepository: getIt())
        ..fetchOrderListByStatus(CustomerDB.getCustomer()!.customer_id!, 0),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 248, 251, 1),
        body: SingleChildScrollView(
          child: Container(child: Consumer<OrderViewModel>(
            builder: (context, value, child) {
              switch (value.orderListByStatus.status) {
                case Status.completed:
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.orderListByStatus.data!.length,
                    itemBuilder: (context, index) {
                      return OrderComponent(
                          orderModel: value.orderListByStatus.data![index],
                          orderViewModel: value);
                    },
                  );
                case Status.loading:
                  return Container(
                    child: Center(
                      child: Lottie.asset("assets/raw/waiting_1.json"),
                    ),
                  );
                case Status.error:
                  if (value.orderListByStatus.message == "completed") {
                    return Container(
                      child: Column(
                        children: [
                          Center(
                            child: Lottie.asset("assets/raw/empty.json"),
                          ),
                          Text("Không có đơn đặt phòng nào!")
                        ],
                      ),
                    );
                  }
                  return Container(
                    child: Center(
                      child: Text(value.orderListByStatus.message.toString()),
                    ),
                  );
                default:
                  return Container();
              }
            },
          )),
        ),
      ),
    );
  }
}
