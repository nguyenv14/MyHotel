class AreaModel {
  final int areaId;
  final String areaName;
  final String areaDesc;
  final String areaImage;
  final int areaStatus;

  AreaModel({
    required this.areaId,
    required this.areaName,
    required this.areaDesc,
    required this.areaImage,
    required this.areaStatus,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      areaId: json['area_id'],
      areaName: json['area_name'],
      areaDesc: json['area_desc'],
      areaImage: json['area_image'],
      areaStatus: json['area_status'],
    );
  }

  static List<AreaModel> getListAreaModel(List<dynamic> source) {
    List<AreaModel> hotelList =
        source.map((e) => AreaModel.fromJson(e)).toList();
    return hotelList;
  }
}
