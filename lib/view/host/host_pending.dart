import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:carnova_webapp/bloc/host/host_bloc.dart';
import 'package:carnova_webapp/modal/host_modal.dart';
import 'package:carnova_webapp/resources/components/host/host_card.dart';
import 'package:carnova_webapp/resources/constants/lottiepath.dart';
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
        return Scaffold(
          body: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 219, 219),
                borderRadius: BorderRadius.circular(20)),
            child: pendingHostList.isEmpty
                ? Center(
                    child: SizedBox(
                      height: h / 2,
                      width: w / 2,
                      child: Lottie.asset(LottiePath.loginpageLottie),
                    ),
                  )
                : GridView.builder(
                    itemCount: pendingHostList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final data = pendingHostList[index];
                      return HostCardWid(data: data, index: index);
                    },
                  ),
          ),
        );
      },
    );
  }
}
