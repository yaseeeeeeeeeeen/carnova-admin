import 'package:carnova_webapp/blocs/host_bloc/host_bloc.dart';
import 'package:carnova_webapp/repositories/components/small_button_widget.dart';
import 'package:carnova_webapp/repositories/constants/colors.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class PendingHostScreen extends StatelessWidget {
  const PendingHostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: BlocConsumer<HostBloc, HostState>(
        listener: (context, state) {
          if (state is HostApprovelFailedState) {
            AnimatedSnackBar.material(
              'Something Went Wrong',
              type: AnimatedSnackBarType.error,
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is HostFetchAllHostsSuccessState) {
            if (state.hostPendigData.isEmpty) {
              return Center(
                  child: Lottie.asset('assets/images/noDataFound.json'));
            }
            return ListView.builder(
              itemCount: state.hostPendigData.length,
              itemBuilder: (context, index) {
                final createdBy = state.hostPendigData[index];

                return SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      color: AppColor.lightGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                            mouseCursor: MouseCursor.uncontrolled,
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2017/06/09/23/22/avatar-2388584_1280.png'),
                            ),
                            titleAlignment: ListTileTitleAlignment.center,
                            title: Row(
                              children: [
                                Text(createdBy.name),
                                const SizedBox(width: 80),
                                Text(createdBy.email),
                                const SizedBox(width: 80),
                                Text(createdBy.phone.toString()),
                              ],
                            ),
                            trailing: SmallButtonWidget(
                                onPress: () {
                                  context.read<HostBloc>().add(
                                      HostAprovedClicked(
                                          id: createdBy.id, index: index));
                                },
                                title: 'Verify',
                                color: AppColor.green)),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
