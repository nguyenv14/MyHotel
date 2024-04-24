class BrandModel {
  final int brandId;
  final String brandName;
  final String brandDesc;
  final int brandStatus;

  BrandModel({
    required this.brandId,
    required this.brandName,
    required this.brandDesc,
    required this.brandStatus,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandId: json['brand_id'],
      brandName: json['brand_name'],
      brandDesc: json['brand_desc'],
      brandStatus: json['brand_status'],
    );
  }

  static List<BrandModel> getListBrandModel(List<dynamic> source) {
    List<BrandModel> hotelList =
        source.map((e) => BrandModel.fromJson(e)).toList();
    return hotelList;
  }
}
