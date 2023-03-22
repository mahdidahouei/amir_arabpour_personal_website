import 'package:flutter/material.dart';

import '../../global/widgets/noise_background.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoiseBackground(
        color: Colors.grey,
        intensity: 0.5,
        child: Container(
          color: Colors.black.withOpacity(0.05),
          // height: 500,
          // width: 500,
        ),
      ),
    );
  }
}
