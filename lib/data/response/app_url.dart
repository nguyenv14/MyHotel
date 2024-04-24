class AppUrl {
  static var baseUrl = 'http://192.168.1.19/DoAnCoSo2/api/';
  static var testApi = baseUrl + "get-brand";
  static var CheckLogin = baseUrl + "check-login";

  // Hotel
  static var hoteListByType = baseUrl + "hotel/get-hotel-list-by-type";

  static var hotelListByArea = baseUrl + "hotel/get-hotel-list-by-area";

  //Area
  static var areaList = baseUrl + "area/get-area-list-have-hotel";

  //Banner
  static var bannerList = baseUrl + "banner/get-banner-list";

  //image
  static var hotelImage =
      'http://192.168.1.19/DoAnCoSo2/public/fontend/assets/img/hotel/';
  static var bannerImage =
      'http://192.168.1.19/DoAnCoSo2/public/fontend/assets/img/bannerads/';
}
