import 'package:flutter/material.dart';

import '../../../global/assets/images.dart';

class UIUXImage extends StatelessWidget {
  const UIUXImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 532.0;
    const width = 1024.0;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: FittedBox(
          child: Image.asset(
            MyImages.uiUx,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
