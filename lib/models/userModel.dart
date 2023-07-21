class UserModel {
  UserModel({
    required this.data,
    required this.message,
    required this.status,
    required this.token,
  });

  late final Data data;
  late final String message;
  late final int status;
  String? token;

  UserModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['status'] = status;
    _data['token'] = token;
    return _data;
  }
}

class Data {
  Data({
    required this.email,
    required this.cin,
    required this.firstName,
    required this.lastName,
    this.fcmToken,
    required this.appUserRole,
    required this.locked,
    required this.enabled,
    required this.phoneNumber,
    required this.authorities,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.solde,
  });

  late final String email;
  late final String cin;
  late final String firstName;
  late final String lastName;
  String? fcmToken;
  late final String appUserRole;
  late final bool locked;
  late final bool enabled;
  late final String phoneNumber;
  late final List<Authorities> authorities;
  late final bool accountNonExpired;
  late final bool accountNonLocked;
  late final bool credentialsNonExpired;
  late final double solde;

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    cin = json['cin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fcmToken = json['fcm_token'];
    appUserRole = json['appUserRole'];
    locked = json['locked'];
    enabled = json['enabled'];
    phoneNumber = json['phoneNumber'];
    authorities = List.from(json['authorities'])
        .map((e) => Authorities.fromJson(e))
        .toList();
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    solde = json['solde'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['cin'] = cin;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['fcm_token'] = fcmToken;
    _data['appUserRole'] = appUserRole;
    _data['locked'] = locked;
    _data['enabled'] = enabled;
    _data['phoneNumber'] = phoneNumber;
    _data['authorities'] = authorities.map((e) => e.toJson()).toList();
    _data['accountNonExpired'] = accountNonExpired;
    _data['accountNonLocked'] = accountNonLocked;
    _data['credentialsNonExpired'] = credentialsNonExpired;
    _data['solde'] = solde;
    return _data;
  }
}

class Authorities {
  Authorities({
    required this.authority,
  });

  late final String authority;

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['authority'] = authority;
    return _data;
  }
}
