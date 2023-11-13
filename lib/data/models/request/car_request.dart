class CarRequest {
  String? carNumber;
  String? type;
  String? location;
  String? district;
  CarRequest({
    this.carNumber,
    this.type,
    this.location,
    this.district,
  });

  CarRequest.fromJson(Map<String, dynamic> json) {
    carNumber = json['car_number'];
    type = json['type'];
    location = json['location'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_number'] = carNumber;
    data['type'] = type;
    data['location'] = location;
    data['district'] = district;
    return data;
  }
}
