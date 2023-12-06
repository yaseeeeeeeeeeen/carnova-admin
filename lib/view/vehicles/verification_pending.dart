import 'package:carnova_webapp/bloc/vehicle/vehicle_bloc.dart';
import 'package:carnova_webapp/modal/vehicle_data.dart';
import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';
import 'package:carnova_webapp/resources/components/car_list/carrow.dart';
import 'package:carnova_webapp/resources/components/buttons/loading_button.dart';
import 'package:carnova_webapp/resources/constants/svgpath.dart';
import 'package:carnova_webapp/resources/constants/text_styles.dart';
import 'package:carnova_webapp/utils/colors.dart';
import 'package:carnova_webapp/view/vehicles/vehicle_deteails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<VehicleBloc, VehicleState>(
              builder: (context, state) {
                print('state is $state');
                if (state is VehicleFetchedDataState) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.vehicleModelList[currentPage].length,
                    itemBuilder: (BuildContext context, int index) {
                      VehicleModel vehicle =
                          state.vehicleModelList[currentPage][index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h / 3.5,
                                width: w / 3.5,
                                child: CarouselSlider(
                                  items: vehicle.images
                                      .map((e) => Image.network(
                                            '${Url.baseUrl}/$e',
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                    enableInfiniteScroll: true,
                                    autoPlayCurve: Curves.easeInCubic,
                                    enlargeCenterPage: true,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${vehicle.name} (${vehicle.brand})",
                                      style: Fontstyles.vehicleCardName),
                                  const SizedBox(width: 5),
                                  vehicle.isVerified
                                      ? const Icon(Icons.verified,
                                          color: Colors.blue)
                                      : const SizedBox()
                                ],
                              ),
                              Text(
                                  "HOST :  ${vehicle.createdBy.name.toUpperCase()}",
                                  style: Fontstyles.vehicleCardhost),
                              Text(vehicle.location,
                                  style: Fontstyles.vehicleCardlocation),
                              SubLoadingButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VehicleDetailsScreen(
                                                  vehicleModel: vehicle,
                                                )));
                                  },
                                  title: 'View Details',
                                  isLoading: false)
                            ]),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          BlocBuilder<VehicleBloc, VehicleState>(
            builder: (context, state) {
              if (state is VehicleFetchedDataState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 300),
                  child: NumberPaginator(
                    config: NumberPaginatorUIConfig(
                        buttonSelectedForegroundColor: Colors.white,
                        buttonUnselectedForegroundColor: Colors.white,
                        buttonSelectedBackgroundColor: ColorsModel.thridColour,
                        buttonUnselectedBackgroundColor:
                            ColorsModel.thridColour.withOpacity(0.3)),
                    numberPages: state.vehicleModelList.length,
                    onPageChange: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
