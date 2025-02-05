import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_solution_technical_task/components/color.dart';
import 'package:it_solution_technical_task/components/widget.dart';
import 'package:it_solution_technical_task/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: customTxt("IT Solution Task", 25, black, FontWeight.w500),
        centerTitle: true,
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              customTxt(
                  "Add Image generate by html", 18, black, FontWeight.w500),
              gapH(20),
              customTextField("Please enter your text", 300, 16),
              gapH(20),
              customButton(40, 200, white, blue, 8, () {},
                  customTxt("Generate Link", 16, black, FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }
}
