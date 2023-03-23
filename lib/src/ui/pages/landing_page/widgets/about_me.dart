import 'package:amirarabpour/src/ui/global/animations/animated_network_image.dart';
import 'package:amirarabpour/src/ui/global/assets/images.dart';
import 'package:amirarabpour/src/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../global/animations/animated_slide_opacity.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final localizations = AppLocalizations.of(context);
    final themeData = Theme.of(context);

    final isVertical =
        mediaQueryData.size.height + 300 > mediaQueryData.size.width;

    final firstText = Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              width: 512.0,
              child: AnimatedSlideOpacity(
                child: Text(
                  localizations.translate("dummy_description"),
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    final secondText = AnimatedSlideOpacity(
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.center,
              child: SizedBox(
                width: 512.0,
                child: Text(
                  localizations.translate("dummy_description"),
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    final thirdText = Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: const Alignment(0.4, 0.5),
            child: SizedBox(
              width: 512.0,
              child: AnimatedSlideOpacity(
                endToStart: true,
                child: Text(
                  localizations.translate("dummy_description"),
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    const amir = AnimatedNetworkImage(
      MyImages.amir,
      height: 572.0,
      width: 353.0,
    );

    return SizedBox(
      height: isVertical ? null : mediaQueryData.size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 72.0),
        child: Column(
          children: [
            if (isVertical) ...[
              amir,
              const SizedBox(
                height: 92.0,
              ),
              firstText,
              const SizedBox(
                height: 92.0,
              ),
              secondText,
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        firstText,
                        const SizedBox(
                          height: 132.0,
                        ),
                        secondText,
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 170.0),
                    child: amir,
                  ),
                ],
              ),
            const SizedBox(
              height: 92.0,
            ),
            thirdText,
            const SizedBox(
              height: 92.0,
            ),
          ],
        ),
      ),
    );
  }
}
