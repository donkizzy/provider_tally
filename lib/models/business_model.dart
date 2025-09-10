class BusinessModel {
  final String? bizName;
  final String? bssLocation;
  final String? contactNo;

  BusinessModel({
    this.bizName,
    this.bssLocation,
    this.contactNo,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
    bizName: json["biz_name"],
    bssLocation: json["bss_location"],
    contactNo: json["contct_no"],
  );

  Map<String, dynamic> toJson() => {
    "biz_name": bizName,
    "bss_location": bssLocation,
    "contct_no": contactNo,
  };
}
