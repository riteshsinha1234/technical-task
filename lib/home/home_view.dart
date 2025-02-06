import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String imageUrl = ''; // Initialize with an empty string
  final TextEditingController _controller = TextEditingController();

  void _updateImageUrl() {
    setState(() {
      imageUrl = _controller
          .text; // Update the image URL with the text from the TextField
    });
  }

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageUrl.isNotEmpty // Check if the imageUrl is not empty
                    ? Image.network(
                        imageUrl,
                        width: 500,
                        height: 300,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error, color: Colors.red),
                              const SizedBox(height: 10),
                              const Text(
                                "Error: your link is not working",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.red),
                              ),
                            ],
                          );
                        },
                      )
                    : Container(
                        width: 500,
                        height: 300,
                        color: Colors
                            .grey[300], // Background color for the container
                        child: const Center(
                          child: Text(
                            'No Image Available',
                            style:
                                TextStyle(fontSize: 24, color: Colors.black54),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        _controller, // Set the controller for the TextField
                    decoration: const InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      _updateImageUrl, // Call the method to update the image URL
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
