import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_solution_technical_task/components/color.dart';
import 'package:it_solution_technical_task/components/widget.dart';
import 'package:it_solution_technical_task/home/home_controller.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({super.key, required this.imageUrl});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Obx(() {
        return Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Dark background when menu is open
            if (controller.isMenuOpen.value)
              const ModalBarrier(
                dismissible: false,
                color: Colors.black54,
              ),
          ],
        );
      }),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset offset = renderBox.localToGlobal(Offset.zero);

            // Toggle the menu open state
            controller.isMenuOpen.value = !controller.isMenuOpen.value;

            if (controller.isMenuOpen.value) {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy - 70,
                  offset.dx + renderBox.size.width,
                  offset.dy,
                ),
                items: [
                  PopupMenuItem(
                    child: customTxt(
                        "Exit Full Screen", 16, blk24, FontWeight.w400),
                    onTap: () {
                      Navigator.pop(context);
                      controller.isMenuOpen.value = false;
                    },
                  ),
                ],
              ).then((_) {
                controller.isMenuOpen.value = false;
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
