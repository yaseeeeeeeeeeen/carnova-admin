// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleModelToJson(List<VehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleModel {
    String id;
    String name;
    int price;
    String transmission;
    String brand;
    String number;
    int seat;
    String fuel;
    String location;
    double lat;
    double long;
    CreatedBy createdBy;
    List<String> images;
    bool isVerified;
    List<dynamic> review;
    int v;
    String document;
    int createdyear;

    VehicleModel({
        required this.id,
        required this.name,
        required this.price,
        required this.transmission,
        required this.brand,
        required this.number,
        required this.seat,
        required this.fuel,
        required this.location,
        required this.lat,
        required this.long,
        required this.createdBy,
        required this.images,
        required this.isVerified,
        required this.review,
        required this.v,
        required this.document,
        required this.createdyear,
    });

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        transmission: json["transmission"],
        brand: json["brand"],
        number: json["number"],
        seat: json["seat"],
        fuel: json["fuel"],
        location: json["location"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        images: List<String>.from(json["images"].map((x) => x)),
        isVerified: json["isVerified"],
        review: List<dynamic>.from(json["review"].map((x) => x)),
        v: json["__v"],
        document: json["document"],
        createdyear: json["createdyear"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "transmission": transmission,
        "brand": brand,
        "number": number,
        "seat": seat,
        "fuel": fuel,
        "location": location,
        "lat": lat,
        "long": long,
        "createdBy": createdBy.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "isVerified": isVerified,
        "review": List<dynamic>.from(review.map((x) => x)),
        "__v": v,
        "document": document,
        "createdyear": createdyear,
    };
}

class CreatedBy {
    String id;
    String name;
    String email;
    int phone;
    String password;
    bool isBlocked;
    bool isVerified;
    int v;
    String profile;

    CreatedBy({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.isBlocked,
        required this.isVerified,
        required this.v,
        required this.profile,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isBlocked: json["isBlocked"],
        isVerified: json["isVerified"],
        v: json["__v"],
        profile: json["profile"],
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
