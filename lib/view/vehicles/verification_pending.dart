import 'package:carnova_webapp/resources/components/image_slider.dart';
import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingVerification extends StatelessWidget {
  const PendingVerification({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carImage = [ImagePaths.car1, ImagePaths.car2, ImagePaths.car3];
    TextStyle style1 = GoogleFonts.outfit(fontSize: 18);
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Container(
        height: h,
        width: w,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5, crossAxisCount: 3),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: h / 4.5,
                      // width: w / 5,
                      child: CustomImageSlider(images: carImage)),
                  Text(
                    "PORSCHE 991",
                    style: style1,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        textStyle: const TextStyle(color: Colors.white)),
                    child: Text(
                      "VIEW MORE",
                      style: GoogleFonts.outfit(),
                    ),
                  )
                ],
              ),
            ),
          ),
          itemCount: 2,
        ));
  }
}
