import 'package:carnova_webapp/bloc/host/host_bloc.dart';
import 'package:carnova_webapp/modal/host_modal.dart';
import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';
import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/resources/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HostCardWid extends StatelessWidget {
  HostModal data;
  int index;
  HostCardWid({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
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
                  backgroundImage:
                      NetworkImage("${Url.baseUrl}/${data.profile}"),
                )
              : CircleAvatar(
                  radius: h / 8,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(ImagePaths.profileimageDemo),
                ),
          Text(
            data.name.toUpperCase(),
            style: Fontstyles.hostCardName,
          ),
          Text(data.email, style: Fontstyles.hostCardemail),
          Text("PHONE : ${data.phone}", style: Fontstyles.hostCardemail),
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
              BlocBuilder<HostBloc, HostState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<HostBloc>()
                          .add(HostAprovedClicked(index: index, id: data.id));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(w / 14, 40)),
                    child: state is! LoadingState
                        ? Text(
                            "VERIFY",
                            style: Fontstyles.buttonText,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2)),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
