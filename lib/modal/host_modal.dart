// To parse this JSON data, do
//
//     final hostModal = hostModalFromJson(jsonString);

import 'dart:convert';

HostModal hostModalFromJson(String str) {
    final jsonData = json.decode(str);
    return HostModal.fromJson(jsonData);
}

String hostModalToJson(HostModal data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class HostModal {
    String id;
    String name;
    String email;
    int phone;
    String password;
    bool isBlocked;
    bool isVerified;
    int v;
    String? profile;

    HostModal({
       required this.id,
       required this.name,
       required this.email,
       required this.phone,
       required this.password,
       required this.isBlocked,
       required this.isVerified,
       required this.v,
        this.profile,
    });

    factory HostModal.fromJson(Map<String, dynamic> json) =>  HostModal(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isBlocked: json["isBlocked"],
        isVerified: json["isVerified"],
        v: json["__v"],
        profile: json["profile"]??"",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "isBlocked": isBlocked,
        "isVerified": isVerified,
        "__v": v,
        "profile": profile,
    };
}


