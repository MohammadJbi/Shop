import 'package:apple_shop_application/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [CustomColors.blue],
          strokeWidth: 2,
        ),
      ),
    );
  }
}
