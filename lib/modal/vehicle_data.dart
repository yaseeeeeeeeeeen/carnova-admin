import 'package:carnova_webapp/modal/host_modal.dart';

class VehicleModel {
  String id;
  String name;
  int price;
  int model;
  String transmission;
  String brand;
  int seat;
  String fuel;
  String location;
  HostModal createdBy;
  List<String> images;
  bool isVerified;
  List<dynamic> review;
  int v;
  String document;

  VehicleModel({
    required this.id,
    required this.name,
    required this.price,
    required this.model,
    required this.transmission,
    required this.brand,
    required this.fuel,
    required this.seat,
    required this.location,
    required this.createdBy,
    required this.images,
    required this.isVerified,
    required this.review,
    required this.v,
    required this.document,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      model: json['model'],
      transmission: json['transmission'],
      brand: json['brand'],
      fuel: json['fuel'],
      seat: json['seat'],
      location: json['location'],
      createdBy: HostModal.fromJson(json['createdBy']),
      images: List<String>.from(json['images']),
      isVerified: json['isVerified'],
      review: List<dynamic>.from(json['review']),
      v: json['__v'],
      document: json['document'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'model': model,
      'transmission': transmission,
      'brand': brand,
      'fuel': fuel,
      'seat': seat,
      'location': location,
      'createdBy': createdBy.toJson(),
      'images': images,
      'isVerified': isVerified,
      'review': review,
      '__v': v,
      'document': document,
    };
  }
}


