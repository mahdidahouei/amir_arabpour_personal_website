import 'package:amirarabpour/src/ui/global/animations/animated_network_image.dart';
import 'package:amirarabpour/src/ui/global/animations/animated_scale.dart';
import 'package:amirarabpour/src/ui/global/animations/floating_widget.dart';
import 'package:amirarabpour/src/ui/global/bloc/theme_switcher_cubit/theme_switcher_cubit.dart';
import 'package:amirarabpour/src/ui/global/localizations/app_localizations.dart';
import 'package:amirarabpour/src/ui/global/widgets/my_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/assets/images.dart';

class IntroductionContent extends StatefulWidget {
  const IntroductionContent({Key? key}) : super(key: key);

  @override
  State<IntroductionContent> createState() => _IntroductionContentState();
}

class _IntroductionContentState extends State<IntroductionContent> {
  double _uiUxHeight = 796.0;
  double _uiUxWidth = 1136.0;

  Widget _buildUIUXImage() {
    const horizontalPadding = 56.0;
    const verticalPadding = 132.0;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        height: _uiUxHeight,
        width: _uiUxWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Builder(builder: (context) {
            final renderObj = context.findRenderObject();
            if (renderObj is RenderBox) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                if (mounted) {
                  setState(() {
                    _uiUxWidth = renderObj.size.width + horizontalPadding * 2;
                    _uiUxHeight = renderObj.size.height + verticalPadding * 2;
                  });
                }
              });
            }
            return BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
                builder: (context, state) {
              return AnimatedNetworkImage(
                state.appTheme == MyAppThemes.light
                    ? MyImages.uiUx
                    : MyImages.uiUxDark,
              );
            });
          }),
        ),
      ),
    );
  }

  Widget _buildGetInTouchButton() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 800.0,
          bottom: 460.0,
        ),
        child: MyAnimatedScale(
          child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
            builder: (context, state) {
              return AnimatedNetworkImage(
                state.appTheme == MyAppThemes.light
                    ? MyImages.getInTouch
                    : MyImages.getInTouchDark,
                height: 335,
                width: 335,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUiUxAndGetInTouch() {
    return Center(
      child: Stack(
        // alignment: AlignmentDirectional.topEnd,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 466.0,
                end: 750.0,
              ),
              child: Transform(
                transform: Matrix4.translationValues(-16.0, 92.0, 1.0),
                child: FloatingWidget(
                  child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
                    builder: (context, state) {
                      return AnimatedNetworkImage(
                        state.appTheme == MyAppThemes.light
                            ? MyImages.prism
                            : MyImages.prismDark,
                        height: 354.0,
                        width: 354.0,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          _buildUIUXImage(),
          _buildGetInTouchButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final localizations = AppLocalizations.of(context);
    final themeData = Theme.of(context);
    final themeSwitcherCubit = context.read<ThemeSwitcherCubit>();

    final isVertical = mediaQueryData.size.height > mediaQueryData.size.width;

    final myPortfolioTextWidget = Text(
      localizations.translate("my_portfolio"),
      style: themeData.textTheme.bodySmall,
    );

    final themeSwitcher = BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
      bloc: themeSwitcherCubit,
      builder: (context, state) {
        return MySwitch(
          value: state.appTheme == MyAppThemes.dark,
          onChanged: (isDark) {
            if (isDark) {
              themeSwitcherCubit.switchToDark();
            } else {
              themeSwitcherCubit.switchToLight();
            }
          },
        );
      },
    );

    return SizedBox(
      height: isVertical ? null : mediaQueryData.size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: isVertical
            ? Column(
                children: [
                  const SizedBox(
                    height: 56.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPortfolioTextWidget,
                      themeSwitcher,
                    ],
                  ),
                  _buildUiUxAndGetInTouch(),
                ],
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  PositionedDirectional(
                    top: 56.0,
                    start: 0.0,
                    child: myPortfolioTextWidget,
                  ),
                  PositionedDirectional(
                    top: 56.0,
                    end: 0.0,
                    child: themeSwitcher,
                  ),
                  Center(child: _buildUiUxAndGetInTouch()),
                ],
              ),
      ),
    );
  }
}
