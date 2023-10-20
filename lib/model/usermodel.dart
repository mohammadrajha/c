class UserModel {
  final String? phone_number;
  final String? password;
  final String? u_id;
  final int? verificationCode;
  final String? otpCode;
  // final String username;
  // final LatLng? location;
  // final String city;
  // final String street;
  // final String buldingno;
  // final String apartmentno;
  // final String nearestfamouslandmark;
  // final String note;

  UserModel({
    this.u_id,
    this.phone_number,
    this.password,
    this.verificationCode,
    this.otpCode,

    // required this.username,
    // required this.location,
    // required this.city,
    // required this.street,
    // required this.buldingno,
    // required this.apartmentno,
    // required this.nearestfamouslandmark,
    // required this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone_number, ': phone_number,
      'password': password,
      'Verification_Code': verificationCode,
      'user_verification_code': otpCode,
      // 'username': username,
      // 'latitude': location?.latitude,
      // 'longitude': location?.longitude,
      // 'city': city,
      // 'street': street,
      // 'buldingno': buldingno,
      // 'apartmentno': apartmentno,
      // 'nearestfamouslandmark': nearestfamouslandmark,
      // 'note': note,
    };
  }
}
