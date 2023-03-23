import 'package:amirarabpour/src/ui/global/animations/animated_network_image.dart';
import 'package:amirarabpour/src/ui/global/assets/images.dart';
import 'package:amirarabpour/src/ui/global/bloc/theme_switcher_cubit/theme_switcher_cubit.dart';
import 'package:amirarabpour/src/ui/pages/landing_page/widgets/about_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/introduction_content.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = [
      const IntroductionContent(),
      const SizedBox(
        height: 92.0,
      ),
      const AboutMe(),
    ];

    final list = ListView.builder(
      itemCount: content.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => content[index],
    );

    return BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
      builder: (context, state) {
        return Scaffold(
          body: state.appTheme == MyAppThemes.light
              ? AnimatedNetworkImage(
                  MyImages.noiseBackground,
                  child: list,
                )
              : list,
        );
      },
    );
  }
}
