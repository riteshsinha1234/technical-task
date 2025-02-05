// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:it_solution_technical_task/components/color.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

//screen size
SizedBox gapH(double value) => SizedBox(height: value);
SizedBox gapW(double value) => SizedBox(width: value);
screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Custom Text
Text customTxt(
  String text,
  double size,
  Color clr,
  FontWeight weight,
) {
  return Text(
    text,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: "Roboto"),
  );
}

// For paragraph Text
Text customParaTxt(
  String txt,
  double size,
  Color clr,
  FontWeight weight,
  TextAlign align,
) {
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: "Roboto"),
  );
}

// Custom TextFiled

customTextField(txt, wt, txtsz) {
  return SizedBox(
    height: 40,
    width: wt,
    child: TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.all(6),
        hintText: txt,
        hintStyle: TextStyle(
            color: blk55,
            fontSize: txtsz,
            fontWeight: FontWeight.w300,
            fontFamily: 'Roboto'),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              width: 1,
              color: toggrey,
            )),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1,
            color: toggrey,
          ),
        ),
      ),
    ),
  );
}

// Custom Button
customButton(ht, wt, btnclr, bdrclr, rdus, clk, widget) {
  return MaterialButton(
    elevation: 0.0,
    height: ht,
    minWidth: wt,
    color: btnclr,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(rdus),
        side: BorderSide(color: bdrclr)),
    onPressed: clk,
    child: widget,
  );
}

// Floating Action Button ========================================>
class ExpandableFab extends StatelessWidget {
  const ExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller using GetX
    final controller = Get.put(FloatingButtonController());

    return Obx(() {
      return SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            _buildTapToCloseFab(controller, context), // Pass BuildContext here
            ..._buildExpandingActionButtons(controller),
            _buildTapToOpenFab(controller),
          ],
        ),
      );
    });
  }

  // Function to create the close button
  Widget _buildTapToCloseFab(
      FloatingButtonController controller, BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: () => controller.toggle(),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to create the expanding action buttons
  List<Widget> _buildExpandingActionButtons(
      FloatingButtonController controller) {
    final children = <Widget>[];
    const count = 3; // Hardcoded for 3 buttons
    const step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: 112,
          progress:
              controller.isOpen.value ? 1.0 : 0.0, // Control animation state
          child: ActionButton(
            onPressed: () {
              // Perform your action when an action button is pressed
            },
            icon:
                const Icon(Icons.create), // Adjust icon based on index or type
          ),
        ),
      );
    }
    return children;
  }

  // Function to create the open button
  Widget _buildTapToOpenFab(FloatingButtonController controller) {
    return IgnorePointer(
      ignoring: controller.isOpen.value,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          controller.isOpen.value ? 0.7 : 1.0,
          controller.isOpen.value ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: controller.isOpen.value ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: () => controller.toggle(),
            child: const Icon(Icons.create),
          ),
        ),
      ),
    );
  }
}

class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final double progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offset = Offset.fromDirection(
      directionInDegrees * (math.pi / 180.0),
      progress * maxDistance,
    );
    return Positioned(
      right: 4.0 + offset.dx,
      bottom: 4.0 + offset.dy,
      child: Transform.rotate(
        angle: (1.0 - progress) * math.pi / 2,
        child: FadeTransition(
          opacity: AlwaysStoppedAnimation(progress),
          child: child,
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

// FAB Controller

class FloatingButtonController extends GetxController {
  var isOpen = false.obs;

  // Toggle the floating button's state
  void toggle() {
    isOpen.value = !isOpen.value;
  }
}

// Floating Action Button ========================================>