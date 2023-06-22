class AuthModel {
  String? fullname;
  String? id;
  String? phone;
  String? address;
  String? customerCode;
  Session? session;

  AuthModel({
    this.fullname,
    this.id,
    this.phone,
    this.address,
    this.customerCode,
    this.session,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    id = json['id'];
    phone = json['phone'];
    address = json['address'];
    customerCode = json['customer_code'];
    session =
        json['session'] != null ? Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['id'] = id;
    data['phone'] = phone;
    data['address'] = address;
    data['customer_code'] = customerCode;
    if (session != null) {
      data['session'] = session!.toJson();
    }
    return data;
  }
}

class Session {
  String? expiredAt;
  String? key;

  Session({this.expiredAt, this.key});

  Session.fromJson(Map<String, dynamic> json) {
    expiredAt = json['expiredAt'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expiredAt'] = expiredAt;
    data['key'] = key;
    return data;
  }
}
