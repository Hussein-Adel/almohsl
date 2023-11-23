class CarDataResponse {
  int? id;
  String? carNumber;
  String? username;
  String? type;
  String? location;
  String? district;
  String? lat;
  String? lng;
  String? url;
  String? date;
  String? vehicleManufacturer;
  String? vehicleModel;
  String? trafficStructure;
  String? source;
  String? color;
  String? modelYear;
  String? boardRegistrationType;
  String? userIdentity;
  String? contractNumber;
  String? cic;
  String? certificateStatus;
  String? vehiclesCount;
  String? product;
  String? installmentsCount;
  String? lateDaysCount;
  String? city;
  String? employer;
  CarDataResponse(
      {this.carNumber,
      this.type,
      this.location,
      this.district,
      this.url,
      this.lng,
      this.lat});

  CarDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carNumber = json['car_number'];
    username = json['username'];
    type = json['type'];
    location = json['location'];
    district = json['district'];
    lat = json['lat'];
    lng = json['lng'];
    url = json['url'];
    date = json['date'];
    vehicleManufacturer = json['vehicle_manufacturer'];
    vehicleModel = json['vehicle_model'];
    trafficStructure = json['traffic_structure'];
    source = json['source'];
    color = json['color'];
    modelYear = json['model_year'];
    boardRegistrationType = json['board_registration_type'];
    userIdentity = json['user_identity'];
    contractNumber = json['contract_number'];
    cic = json['cic'];
    certificateStatus = json['certificate_status'];
    vehiclesCount = json['vehicles_count'];
    product = json['product'];
    installmentsCount = json['installments_count'];
    lateDaysCount = json['late_days_count'];
    city = json['city'];
    employer = json['employer'];
  }
}
