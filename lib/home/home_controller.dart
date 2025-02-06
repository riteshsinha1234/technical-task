import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_solution_technical_task/full_screen/full_screen_view.dart';

class HomeController extends GetxController {
  var imageUrl = ''.obs;
  var textFieldValue = ''.obs;
  // Track whether the menu is open
  final RxBool isMenuOpen = false.obs;

  void updateImageUrl() {
    imageUrl.value = textFieldValue.value;
  }

  void navigateToFullScreen(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullScreenImage(imageUrl: imageUrl.value),
        ),
      );
    }
  }
}
