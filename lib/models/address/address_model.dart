class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonPhone;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel(
      {id,
      required addressType,
      contactPersonName,
      contactPersonPhone,
      address,
      latitude,
      longitude}) {
    _id = id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonPhone = contactPersonPhone;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
  }

  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonPhone => _contactPersonPhone;
  String get latitude => _latitude;
  String get longitude => _longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _addressType = json["address_type"] ?? "";
    _contactPersonName = json["contact_person_name"] ?? "";
    _contactPersonPhone = json["contact_person_number"] ?? "";
    _address = json["address"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = _id;
    data['address'] = _address;

    data["latitude"] = _latitude;
    data["longitude"] = _longitude;
    data["contact_person_number"] = _contactPersonPhone;
    data["contact_person_name"] = _contactPersonName;
    data["address_type"] = _addressType;

    return data;
  }
}
