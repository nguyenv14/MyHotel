import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/configs/text_style.dart';
import 'package:my_hotel/data/response/app_url.dart';
import 'package:my_hotel/data/response/status.dart';
import 'package:my_hotel/main.dart';
import 'package:my_hotel/model/area_model.dart';
import 'package:my_hotel/model/banner_model.dart';
import 'package:my_hotel/model/hotel_model.dart';
import 'package:my_hotel/utils/app_functions.dart';
import 'package:my_hotel/utils/user_db.dart';
import 'package:my_hotel/view/home/components/dropdown.dart';
import 'package:my_hotel/view/login/components/InputFieldComponet.dart';
import 'package:my_hotel/view_model/area_view_model.dart';
import 'package:my_hotel/view_model/banner_view_model.dart';
import 'package:my_hotel/view_model/hotel_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listHotelType = [
    "Khách sạn",
    "Khách sạn căn hộ",
    "Khu nghỉ dưỡng"
  ];
  int indexHotelType = 0;
  int areaIndex = 0;
  int areaId = 3;
  // List<AreaModel> areaList = AreaViewModel(areaRepository: getIt())..fetchAreaList();
  late HotelViewModel hotelViewModelByType;
  late HotelViewModel hotelViewModelByArea;
  late AreaViewModel areaViewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              SizedBox(
                height: context.mediaQueryHeight * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HELLO THERE',
                            style: MyTextStyle.textStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                              CustomerDB.getNameCustomer()!
                                  .customer_name
                                  .toString(),
                              style: MyTextStyle.textStyle(
                                  fontSize: 18, color: Colors.blueGrey))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 100, offset: Offset(1, 1))
                          ]),
                      child: Icon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueGrey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Explore Something Fun",
                      hintStyle: MyTextStyle.textStyle(
                          fontSize: 15, color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Container(
                        // width: 20,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.blueGrey.withOpacity(0.3))),
                        child: Icon(
                          FontAwesomeIcons.toolbox,
                          size: 20,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Loại khách sạn",
                      style: MyTextStyle.textStyle(fontSize: 15),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "See all",
                            style: MyTextStyle.textStyle(fontSize: 15),
                          ),
                          Icon(
                            FontAwesomeIcons.angleRight,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: context.mediaQueryWidth,
                height: context.mediaQueryWidth * 0.13,
                padding: EdgeInsets.symmetric(vertical: 3),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listHotelType.length,
                  itemBuilder: (context, index) {
                    return hotelTypeButton(
                        index, listHotelType[index], hotelViewModelByType);
                  },
                ),
              ),
              ChangeNotifierProvider<HotelViewModel>(
                create: (context) => HotelViewModel(hotelRepository: getIt())
                  ..fetchHotelListByType(),
                child: Consumer<HotelViewModel>(
                  builder: (context, value, child) {
                    hotelViewModelByType = value;
                    switch (value.hotelListByTypeResponse.status) {
                      case Status.loading:
                        return Container(
                          height: context.mediaQueryHeight * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.blueGrey,
                            ),
                          ),
                        );
                      case Status.error:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.completed:
                        return Container(
                          width: context.mediaQueryWidth,
                          height: 270,
                          padding: EdgeInsets.symmetric(
                            vertical: 3,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                value.hotelListByTypeResponse.data!.length,
                            itemBuilder: (context, index) {
                              HotelModel hotelModel =
                                  value.hotelListByTypeResponse.data![index];
                              return WidgetHotelByTypeView(hotelModel, context);
                            },
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.amberAccent,
                            size: 24,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Top nearby",
                            style: MyTextStyle.textStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Location",
                                style: MyTextStyle.textStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.4)),
                              ),
                              widgetTextForLocation(),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey.withOpacity(0.1)),
                            child: Icon(
                              FontAwesomeIcons.locationCrosshairs,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),

              // Container(child: ,)
              ChangeNotifierProvider<HotelViewModel>(
                create: (context) => HotelViewModel(hotelRepository: getIt())
                  ..fetchHotelListByLocation(areaId),
                child: Consumer<HotelViewModel>(
                  builder: (context, value, child) {
                    hotelViewModelByArea = value;
                    switch (value.hotelListByLocation.status) {
                      case Status.loading:
                        return Container(
                          height: context.mediaQueryHeight * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case Status.completed:
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return WidgetHotelByArea(
                                value.hotelListByLocation.data![index],
                                context);
                          },
                          itemCount: value.hotelListByLocation.data!.length,
                          shrinkWrap: true,
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.newspaper,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Insight for You",
                      style: MyTextStyle.textStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                  width: context.mediaQueryWidth,
                  height: context.mediaQueryHeight * 0.35,
                  child: ChangeNotifierProvider<BannerViewModel>(
                    create: (context) =>
                        BannerViewModel(bannerRepository: getIt())
                          ..fetchBannerResponse(),
                    child: Consumer<BannerViewModel>(
                      builder: (context, value, child) {
                        switch (value.bannerListResponse.status) {
                          case Status.loading:
                            return Container(
                              height: context.mediaQueryHeight * 0.2,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          case Status.error:
                            return Center(
                              child: Text(
                                  value.bannerListResponse.message!.toString()),
                            );
                          case Status.completed:
                            return Container(
                              height: context.mediaQueryHeight * 0.6,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    value.bannerListResponse.data!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return WidgetNewsForHotel(
                                      value.bannerListResponse.data![index]);
                                },
                              ),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget hotelTypeButton(
      int index, String hotelString, HotelViewModel hotelViewModel) {
    return GestureDetector(
        onTap: () {
          setState(() {
            indexHotelType = index;
          });
          hotelViewModel.fetchHotelListByType(type: index);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: index == indexHotelType
                    ? Colors.lightBlue.withOpacity(0.4)
                    : Colors.white,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                    color: index == indexHotelType
                        ? Colors.lightBlueAccent.withOpacity(0.4)
                        : Colors.black.withAlpha(130))),
            child: Text(
              hotelString,
              style: MyTextStyle.textStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: index == indexHotelType
                      ? Colors.white
                      : Colors.black.withAlpha(150)),
            )));
  }

  Widget WidgetHotelByTypeView(HotelModel hotelModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: context.mediaQueryWidth * 0.5,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(
                              10)), // Bo tròn ảnh với bán kính 10
                      image: DecorationImage(
                        image: NetworkImage(
                            AppUrl.hotelImage + hotelModel.hotelImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              size: 15,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "4.6",
                              style: MyTextStyle.textStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: context.mediaQueryWidth * 0.39,
                      child: Text(
                        hotelModel.hotelName,
                        style: MyTextStyle.textStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold)
                            .copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size: 15,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          hotelModel.areaModel.areaName.toString(),
                          style: MyTextStyle.textStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: context.mediaQueryWidth * 0.43,
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start from",
                                style: MyTextStyle.textStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.3))),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$" +
                                        AppFunctions.calculatePrice(
                                            hotelModel.rooms[0].roomTypes[0]),
                                    style: MyTextStyle.textStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                  ),
                                  TextSpan(
                                      text: "/night",
                                      style: MyTextStyle.textStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.3)))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pinkAccent.withOpacity(0.2)),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            size: 20,
                            color: Colors.pinkAccent,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetHotelByArea(HotelModel hotelModel, BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, top: 10, right: 20, bottom: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: context.mediaQueryWidth * 0.35,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(
                              10)), // Bo tròn ảnh với bán kính 10
                      image: DecorationImage(
                        image: NetworkImage(
                            AppUrl.hotelImage + hotelModel.hotelImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              size: 15,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "4.6",
                              style: MyTextStyle.textStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: context.mediaQueryWidth * 0.39,
                      child: Text(
                        hotelModel.hotelName,
                        style: MyTextStyle.textStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold)
                            .copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size: 15,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          hotelModel.areaModel.areaName,
                          style: MyTextStyle.textStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: context.mediaQueryWidth * 0.43,
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start from",
                                style: MyTextStyle.textStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.3))),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$" +
                                        AppFunctions.calculatePrice(
                                            hotelModel.rooms[0].roomTypes[0]),
                                    style: MyTextStyle.textStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                  ),
                                  TextSpan(
                                      text: "/night",
                                      style: MyTextStyle.textStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.3)))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pinkAccent.withOpacity(0.2)),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            size: 20,
                            color: Colors.pinkAccent,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetTextForLocation() {
    return GestureDetector(
        onTap: () {
          setState(() {
            areaIndex++;
            if (areaIndex > 4) {
              areaIndex = 0;
            }
          });
          hotelViewModelByArea.fetchHotelListByLocation(
              areaViewModel.areaListResponse.data![areaIndex].areaId);
        },
        child: ChangeNotifierProvider<AreaViewModel>(
          create: (context) =>
              AreaViewModel(areaRepository: getIt())..fetchAreaList(),
          child: Consumer<AreaViewModel>(
            builder: (context, value, child) {
              areaViewModel = value;
              if (value.areaListResponse.status == Status.completed) {
                areaId = value.areaListResponse.data![areaIndex].areaId;
                return Text(
                  value.areaListResponse.data![areaIndex].areaName.toString(),
                  style: MyTextStyle.textStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                );
              } else {
                return Text("Loi");
              }
            },
          ),
        ));
  }

  Widget WidgetNewsForHotel(BannerModel bannerModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: GestureDetector(
          child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.mediaQueryWidth * 0.6,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight:
                        Radius.circular(10)), // Bo tròn ảnh với bán kính 10
                image: DecorationImage(
                  image: NetworkImage(AppUrl.bannerImage + bannerModel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.15)),
                        child: Text(
                          "MODERN",
                          style: MyTextStyle.textStyle(
                              fontSize: 12, color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: context.mediaQueryWidth * 0.5,
                        child: Text(
                          bannerModel.title,
                          style: MyTextStyle.textStyle(
                                  fontSize: 15,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)
                              .copyWith(
                            overflow: TextOverflow.clip,
                          ),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bannerModel.description,
                        style: MyTextStyle.textStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ])),
          ],
        ),
      )),
    );
  }
}
