class CarRequest {
  int? id;
  String? carNumber;
  String? type;
  String? location;
  String? district;
  String? lat;
  String? lng;
  String? url;
  String? date;
  CarRequest(
      {this.carNumber,
      this.type,
      this.location,
      this.district,
      this.url,
      this.lng,
      this.lat});

  CarRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carNumber = json['car_number'];
    type = json['type'];
    location = json['location'];
    district = json['district'];
    lat = json['lat'];
    lng = json['lng'];
    url = json['url'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car_number'] = carNumber;
    data['type'] = type;
    data['location'] = location;
    data['district'] = district;
    data['lat'] = lat;
    data['lng'] = lng;
    data['url'] = url;
    data['date'] = date;
    return data;
  }
}
