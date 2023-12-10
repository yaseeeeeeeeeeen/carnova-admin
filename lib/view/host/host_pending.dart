import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:carnova_webapp/bloc/host/host_bloc.dart';
import 'package:carnova_webapp/modal/host_modal.dart';
import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';
import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/resources/constants/lottiepath.dart';
import 'package:carnova_webapp/resources/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class HostPending extends StatelessWidget {
  const HostPending({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<HostBloc>().add(HostFetchDataEvent());
    List<HostModal> pendingHostList = [];
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return BlocConsumer<HostBloc, HostState>(
      listener: (context, state) {
        if (state is HostFetchAllHostsSuccessState) {
          pendingHostList = state.hostPendigData;
        } else if (state is HostApprovelFailedState) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
          ).show(context);
        }
      },
      builder: (context, state) {
        if (pendingHostList.isEmpty) {
          return Center(
            child: SizedBox(
              height: h / 2,
              width: w / 2,
              child: Lottie.asset(LottiePath.loginpageLottie),
            ),
          );
        }
        return Scaffold(
          body: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 219, 219),
                borderRadius: BorderRadius.circular(20)),
            child: GridView.builder(
              itemCount: pendingHostList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                final data = pendingHostList[index];
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300)),
                  margin: const EdgeInsets.all(10),
                  height: h / 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      data.profile!.isNotEmpty
                          ? CircleAvatar(
                              radius: h / 8,
                              backgroundImage: NetworkImage(
                                  "${Url.baseUrl}/${data.profile}"),
                            )
                          : CircleAvatar(
                              radius: h / 8,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage(ImagePaths.profileimageDemo),
                            ),
                      Text(
                        data.name.toUpperCase(),
                        style: Fontstyles.hostCardName,
                      ),
                      Text(data.email, style: Fontstyles.hostCardemail),
                      Text("PHONE : ${data.phone}",
                          style: Fontstyles.hostCardemail),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size(200, 40)),
                            child: Text(
                              "VIEW DETAILES",
                              style: Fontstyles.buttonText,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<HostBloc>().add(HostAprovedClicked(
                                  index: index, id: data.id));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size(160, 40)),
                            child: Text(
                              "VERIFY",
                              style: Fontstyles.buttonText,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
