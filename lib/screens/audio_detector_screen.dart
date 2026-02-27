import 'package:flutter/material.dart';

class AudioDetectorScreen extends StatelessWidget {
  const AudioDetectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const barColor = Color(0xFF5B22B7);
    const buttonColor = Color(0xFF6D2AEF);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: barColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Check Audio"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: barColor, width: 2),
              ),
              child: const Center(
                child: Text(
                  "Upload Audio\n.mp3",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Audio backend endpoint not added yet."),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: const Text("Check Ai"),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}