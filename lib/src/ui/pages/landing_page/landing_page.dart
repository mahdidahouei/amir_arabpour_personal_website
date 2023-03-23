import 'package:amirarabpour/src/ui/global/widgets/noise_background.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = [
      // const SizedBox(
      //   height: 246,
      // ),
      // const UIUXImage(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NoiseBackground(
        color: Colors.grey[350]!,
        intensity: 0.85,
        child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) => content[index],
        ),
      ),
    );
  }
}
