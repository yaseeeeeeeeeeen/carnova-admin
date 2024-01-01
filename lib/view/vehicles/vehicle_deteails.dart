import 'dart:math';

import 'package:carnova_webapp/bloc/vehicle/vehicle_bloc.dart';
import 'package:carnova_webapp/modal/vehicle_data.dart';
import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';
import 'package:carnova_webapp/resources/components/buttons/verify_button.dart';
import 'package:carnova_webapp/resources/components/image_preview.dart';
import 'package:carnova_webapp/resources/components/navbar.dart';

import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/resources/constants/text_styles.dart';
import 'package:carnova_webapp/utils/verification_succsessbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class VehicleDetailsScreen extends StatelessWidget {
  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  VehicleModel vehicleModel;
  bool? isVerifeid;
  VehicleDetailsScreen({super.key, required this.vehicleModel});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: h / 1.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundImage: vehicleModel
                                  .createdBy.profile!.isEmpty
                              ? NetworkImage(ImagePaths.profiledemo)
                              : NetworkImage(
                                  "${Url.baseUrl}/${vehicleModel.createdBy.profile!}"),
                          radius: 70,
                        ),
                        Text(vehicleModel.createdBy.name,
                            style: Fontstyles.vehicledetailShost),
                        Text(
                            "Verified Host:    ${vehicleModel.createdBy.isVerified}",
                            style: Fontstyles.vehicledetailShost),
                        Text("Email: ${vehicleModel.createdBy.email}",
                            style: Fontstyles.vehicledetailShost),
                        Text("Phone: ${vehicleModel.createdBy.phone}",
                            style: Fontstyles.vehicledetailShost),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("VEHICLE DOCUMENT",
                            style: Fontstyles.vehicledetailShost),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ImagePreviewWid(
                                    imageUrl: vehicleModel.document)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${Url.baseUrl}/${vehicleModel.document}"),
                                    fit: BoxFit.cover)),
                            height: h / 2.5,
                            width: w / 3,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: h / 1.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("VEHICLE IMAGES",
                            style: Fontstyles.vehicledetailShost),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          height: h / 2.3,
                          width: w / 2.8,
                          child: CarouselSlider(
                              items: vehicleModel.images
                                  .map((e) => GestureDetector(
                                        onDoubleTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImagePreviewWid(
                                                          imageUrl: e)));
                                        },
                                        child: Image.network(
                                          '${Url.baseUrl}/$e',
                                          height: h / 2.5,
                                          width: w / 3,
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                enableInfiniteScroll: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                              )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("VEHICLE NAME: ${vehicleModel.name.toUpperCase()}",
                            style: Fontstyles.vehicledetailShost),
                        Text(
                            "VEHICLE BRAND: ${vehicleModel.brand.toUpperCase()}",
                            style: Fontstyles.vehicledetailShost),
                        Text("VEHICLE SEAT CAPACITY: ${vehicleModel.seat}",
                            style: Fontstyles.vehicledetailShost),
                        Text(
                            "VEHICLE TRANSMISSION: ${vehicleModel.transmission.toUpperCase()}",
                            style: Fontstyles.vehicledetailShost),
                        Text("VEHICLE FUEL: ${vehicleModel.fuel.toUpperCase()}",
                            style: Fontstyles.vehicledetailShost),
                        Text("VEHICLE LOCATION: ${vehicleModel.location}",
                            style: Fontstyles.vehicledetailShost),
                      ],
                    ),
                  ],
                ),
              ),
              vehicleModel.isVerified
                  ? const SizedBox()
                  : SizedBox(
                      width: w,
                      height: 70,
                      child: BlocConsumer<VehicleBloc, VehicleState>(
                        listener: (context, state) {
                          if (state is VehicleVerifyHostVehicleSuccessState) {
                            isVerifeid = true;
                            AlertBoxes().showSuccessDialog(
                                context, "Verification Succsess", () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => ScreenParent()));
                            });
                          }
                        },
                        builder: (context, state) {
                          return Row(
                            children: [
                              LoadingWid2(
                                  color: Colors.black,
                                  ontap: () {
                                    context.read<VehicleBloc>().add(
                                        VehicleVerifyHostVehicle(
                                            vehicleId: vehicleModel.id,
                                            hostId: vehicleModel.createdBy.id));
                                  },
                                  text: "VERIFY",
                                  isLoading: state is VehicleVerifyLoading),
                              const SizedBox(width: 20),
                              LoadingWid2(
                                  color: Colors.red,
                                  ontap: () {},
                                  text: "REJECT",
                                  isLoading: false)
                            ],
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
