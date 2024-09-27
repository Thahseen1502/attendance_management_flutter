import 'package:flutter/material.dart';
import 'package:login_page/themes/colors.dart';
import 'package:login_page/widgets/custom_painters.dart';
import 'package:login_page/widgets/custom_shape_clippers.dart';

class AppBackground extends StatelessWidget {
  final Widget data;
  final bool isDarkMode;

  const AppBackground({Key? key, required this.data, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _drawCircles(context),
          data,
          // Positioned(bottom: 5, left: 5, child: _drawCirclesbottom(context))
        ],
      ),
    );
  }

  Widget _drawCircles(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    // Get the current theme brightness
    // var brightness = Theme.of(context).brightness;

    // Determine the color based on the theme
    Color backgroundColor;
    if (isDarkMode) {
      backgroundColor = Colors.white; // Use white for dark theme
    } else {
      backgroundColor = AppColors.primary; // Use primary color for light theme
    }

    return Container(
      height: heightOfScreen * 0.2,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: SemiCircleShapeClipper2(),
            child: Container(
              height: heightOfScreen * 0.2,
              width: widthOfScreen,
              color: backgroundColor,
            ),
          ),
          Container(
            height: heightOfScreen * 0.2,
            width: widthOfScreen,
            child: Opacity(
              opacity: 0.9,
              child: CustomPaint(
                painter: DrawCircle(
                    offset: Offset(widthOfScreen * 0.7, heightOfScreen * 0.1),
                    radius: 70.0,
                    color: AppColors.secondary),
              ),
            ),
          ),
          ClipPath(
            clipper: SemiCircleShapeClipper(),
            child: Opacity(
              opacity: 0.95,
              child: Container(
                height: heightOfScreen * 0.2,
                width: widthOfScreen,
                color: AppColors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCirclesbottom(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    // Get the current theme brightness
    // var brightness = Theme.of(context).brightness;

    // Determine the color based on the theme
    Color backgroundColor;
    if (isDarkMode) {
      backgroundColor = Colors.white; // Use white for dark theme
    } else {
      backgroundColor = AppColors.primary; // Use primary color for light theme
    }

    return Container(
      height: heightOfScreen * 0.2,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: SemiCircleShapeClipper2(),
            child: Container(
              height: heightOfScreen * 0.2,
              width: widthOfScreen,
              color: backgroundColor,
            ),
          ),
          Container(
            height: heightOfScreen * 0.2,
            width: widthOfScreen,
            child: Opacity(
              opacity: 0.9,
              child: CustomPaint(
                painter: DrawCircle(
                    offset: Offset(widthOfScreen * 0.7, heightOfScreen * 0.1),
                    radius: 70.0,
                    color: AppColors.secondary),
              ),
            ),
          ),
          ClipPath(
            clipper: SemiCircleShapeClipper(),
            child: Opacity(
              opacity: 0.95,
              child: Container(
                height: heightOfScreen * 0.2,
                width: widthOfScreen,
                color: AppColors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
