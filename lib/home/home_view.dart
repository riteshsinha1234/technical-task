import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle the button press logic here.
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the floating action button press logic here.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
