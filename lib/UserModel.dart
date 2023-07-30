class UserModel {
  UserModel({
    required this.email,
    required this.cin,
    required this.firstName,
    required this.lastName,
    required this.fcmToken,
    required this.phoneNumber,
    required this.solde,
    required this.appUserRole,
    required this.locked,
    required this.enabled,
    required this.deviceId,
    required this.longitude,
    required this.latitude,
    required this.loginTime,
  });

  late final String email;
  late final String cin;
  late final String firstName;
  late final String lastName;
  late final String fcmToken;
  late final String phoneNumber;
  late final double solde;
  late final String appUserRole;
  late final bool locked;
  late final bool enabled;
  late final String deviceId;
  late final double longitude;
  late final double latitude;
  late final DateTime loginTime;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    cin = json['cin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fcmToken = json['fcm_token'];
    phoneNumber = json['phoneNumber'];
    solde = json['solde'];
    appUserRole = json['appUserRole'];
    locked = json['locked'];
    enabled = json['enabled'];
    deviceId = json['deviceId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    loginTime = DateTime.parse(json['loginTime']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['cin'] = cin;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['fcm_token'] = fcmToken;
    _data['phoneNumber'] = phoneNumber;
    _data['solde'] = solde;
    _data['appUserRole'] = appUserRole;
    _data['locked'] = locked;
    _data['enabled'] = enabled;
    _data['deviceId'] = deviceId;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['loginTime'] = loginTime.toIso8601String();
    return _data;
  }
}
