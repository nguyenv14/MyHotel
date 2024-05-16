import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/configs/text_style.dart';
import 'package:my_hotel/model/order_model.dart';
import 'package:my_hotel/view/product/components/line_component.dart';

class OrderDetailPage extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetailPage({super.key, required this.orderModel});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 249, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Order Room Detail",
          style: MyTextStyle.textStyle(fontSize: 20, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://i.kinja-img.com/gawker-media/image/upload/s--S-3T-M-5--/c_fill,fl_progressive,g_center,h_900,q_80,w_1600/18lppqix6qgcejpg.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        width: context.mediaQueryWidth * 0.18,
                        height: context.mediaQueryHeight * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Hotel del luna",
                          style: MyTextStyle.textStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          "131, Tran Du, Da Nang",
                          style: MyTextStyle.textStyle(
                              fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.2))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Check in",
                          style: MyTextStyle.textStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          "05-05-2024",
                          style: MyTextStyle.textStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidMoon,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "2",
                            style: MyTextStyle.textStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Check out",
                          style: MyTextStyle.textStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          "05-05-2024",
                          style: MyTextStyle.textStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.2))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phòng vip delexury",
                      style: MyTextStyle.textStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "https://i.kinja-img.com/gawker-media/image/upload/s--S-3T-M-5--/c_fill,fl_progressive,g_center,h_900,q_80,w_1600/18lppqix6qgcejpg.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        width: context.mediaQueryWidth * 0.14,
                        height: context.mediaQueryHeight * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemOptionOrderHotel(
                            FontAwesomeIcons.utensils, "Breakfast included"),
                        SizedBox(
                          height: 5,
                        ),
                        itemOptionOrderHotel(
                            FontAwesomeIcons.solidUser, "2 guest"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemOptionOrderHotel(FontAwesomeIcons.bed, "Twin bed"),
                        SizedBox(
                          height: 5,
                        ),
                        itemOptionOrderHotel(
                            FontAwesomeIcons.layerGroup, "24m2"),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.2))),
                ),
                Text(
                  "SPECIAL REQUESTS",
                  style: MyTextStyle.textStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  "High floor",
                  style: MyTextStyle.textStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                Text(
                  "High floor",
                  style: MyTextStyle.textStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      border: DashedBorder.symmetric(
                    horizontal:
                        BorderSide(color: Colors.grey.shade300, width: 2),
                    dashLength: 10,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Icon(FontAwesomeIcons.solidUser)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nguyen Van Vinh Nguyen",
                          style: MyTextStyle.textStyle(
                              fontSize: 14, color: Colors.blueAccent),
                        ),
                        Text(
                          "0839519415",
                          style: MyTextStyle.textStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  "Order code: MYHOTEL1213",
                  style:
                      MyTextStyle.textStyle(fontSize: 13, color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.2))),
                ),
                itemPriceOrder("1 phòng x 1 ngày", 20000),
                SizedBox(
                  height: 10,
                ),
                itemPriceOrder("Phí khách sạn", 20000),
                LineComponent(),
                itemPriceOrder("Tổng giá phòng", 20000),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mã giảm giá",
                          style: MyTextStyle.textStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),
                            child: Text(
                              "HELLOVKU",
                              style: MyTextStyle.textStyle(
                                  fontSize: 12, color: Colors.red),
                            )),
                      ],
                    ),
                    Text(
                      "-200.000đ",
                      style: MyTextStyle.textStyle(
                          fontSize: 12, color: Colors.green),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.2))),
                ),
                itemPriceOrder("Tổng tiền thanh toán", 200000,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  Widget itemOptionOrderHotel(
    IconData iconData,
    String text,
  ) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 12,
          color: Colors.amber,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: MyTextStyle.textStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }

  Widget itemPriceOrder(String text, double price,
      {FontWeight fontWeight = FontWeight.normal}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTextStyle.textStyle(fontSize: 12, fontWeight: fontWeight),
        ),
        Text(
          "1.500.000đ",
          style: MyTextStyle.textStyle(fontSize: 12, fontWeight: fontWeight),
        )
      ],
    );
  }
}
