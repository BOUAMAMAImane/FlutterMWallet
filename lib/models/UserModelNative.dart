class UserModel1 {
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

  late final List<Authorities> authorities;
  late final bool accountNonExpired;
  late final bool accountNonLocked;
  late final bool credentialsNonExpired;

  UserModel1.fromJson(Map<String, dynamic> json) {
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

    authorities = List.from(json['authorities'])
        .map((e) => Authorities.fromJson(e))
        .toList();
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
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

    _data['authorities'] = authorities.map((e) => e.toJson()).toList();
    _data['accountNonExpired'] = accountNonExpired;
    _data['accountNonLocked'] = accountNonLocked;
    _data['credentialsNonExpired'] = credentialsNonExpired;
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
