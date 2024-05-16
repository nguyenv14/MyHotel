import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/configs/text_style.dart';
import 'package:my_hotel/model/order_model.dart';
import 'package:my_hotel/utils/user_db.dart';
import 'package:my_hotel/view/login/components/InputFieldComponet.dart';
import 'package:my_hotel/view/product/components/line_component.dart';
import 'package:my_hotel/view_model/order_view_model.dart';

class CommentComponent extends StatefulWidget {
  final OrderViewModel orderViewModel;
  final OrderModel orderModel;
  const CommentComponent(
      {super.key, required this.orderViewModel, required this.orderModel});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  int service = 0;
  int convinient = 0;
  int position = 0;
  int price = 0;
  int vesinh = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Đánh giá 🏨"),
      content: Container(
        height: context.mediaQueryHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dịch vụ: ",
                  style: MyTextStyle.textStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      service = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Giá cả: ",
                  style: MyTextStyle.textStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      price = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vị trí: ",
                  style: MyTextStyle.textStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      position = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thuận tiện: ",
                  style: MyTextStyle.textStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      convinient = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vệ sinh: ",
                  style: MyTextStyle.textStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      vesinh = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            LineComponent(),
            SizedBox(
              height: 5,
            ),
            Text("Bình luận"),
            SizedBox(
              height: 5,
            ),
            InputFieldComponent(
              hintText: "Nhập bình luận...",
              iconData: FontAwesomeIcons.comment,
              textEditingController: textEditingController,
              color: Colors.pinkAccent[100]!,
              // isPassword: true,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Đóng hộp thoại
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            widget.orderViewModel.sendCommentToOrder(
                CustomerDB.getCustomer()!.customer_id!,
                widget.orderModel.orderId,
                widget.orderModel.orderDetailsModel.hotelId,
                widget.orderModel.orderDetailsModel.roomId,
                widget.orderModel.orderDetailsModel.typeRoomId,
                textEditingController.text,
                price,
                position,
                service,
                vesinh,
                convinient);
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
        ),
      ],
    );
  }
}
