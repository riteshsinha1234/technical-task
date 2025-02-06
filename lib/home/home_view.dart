import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_solution_technical_task/components/color.dart';
import 'package:it_solution_technical_task/components/widget.dart';
import 'package:it_solution_technical_task/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onDoubleTap: () =>
                            controller.navigateToFullScreen(context),
                        child: Obx(() => controller.imageUrl.isNotEmpty
                            ? Image.network(
                                controller.imageUrl.value,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.error, color: red),
                                      gapH(10),
                                      customTxt(
                                          "Error: your link is not working",
                                          24,
                                          red,
                                          FontWeight.w400),
                                    ],
                                  );
                                },
                              )
                            : Container(
                                width: 500,
                                height: 300,
                                color: gry20per,
                                child: Center(
                                    child: customTxt('No Image Available', 24,
                                        blk55, FontWeight.w400)),
                              )),
                      ),
                    ),
                  ),
                  gapH(8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            controller.textFieldValue.value = value;
                          },
                          decoration:
                              const InputDecoration(hintText: 'Image URL'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.updateImageUrl();
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  gapH(64),
                ],
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
                        "Enter Full Screen", 16, blk24, FontWeight.w400),
                    onTap: () {
                      controller.navigateToFullScreen(context);
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
