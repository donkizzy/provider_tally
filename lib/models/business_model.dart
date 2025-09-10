class BusinessModel {
  final String? businessName;
  final String? businessLocation;
  final String? contactNumber;

  BusinessModel({
    this.businessName,
    this.businessLocation,
    this.contactNumber,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
    businessName: json["biz_name"],
    businessLocation: json["bss_location"],
    contactNumber: json["contct_no"],
  );

  Map<String, dynamic> toJson() => {
    "biz_name": businessName,
    "bss_location": businessLocation,
    "contct_no": contactNumber,
  };
}
