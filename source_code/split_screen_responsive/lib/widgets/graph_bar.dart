import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/themes.dart';

class VerticalBarWidget extends StatelessWidget {
  final IconData icon;
  final int numberToPlot;
  final int numberToPlotMax;
  final String title;

  const VerticalBarWidget({
    super.key,
    required this.icon,
    required this.numberToPlot,
    required this.numberToPlotMax,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double sizedBoxHeight = MediaQuery.sizeOf(context).height * 0.7;
    double barHeight = numberToPlot.toDouble();
    barHeight = (sizedBoxHeight * (barHeight / numberToPlotMax)) * 0.7;
    double barWidth = 75.0;
    double barMinHeight = 500.0;
    double iconHeightAndWidth = 48.0;
    double paddingTopAndBottom = 8.0;
    double blurRadius = 3.0;
    double shadowOpacity = 0.3;
    Offset shadowOffset = const Offset(1, 1);

    return Container(
      constraints: BoxConstraints(minHeight: barMinHeight),
      height: sizedBoxHeight,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BuildIcon(
            icon: icon,
            height: iconHeightAndWidth,
            width: iconHeightAndWidth,
          ),
          Padding(padding: EdgeInsets.only(top: paddingTopAndBottom)),
          Container(
            width: barWidth,
            height: barHeight,
            color: ThemeColors.lightGreenShade400,
          ),
          Padding(padding: EdgeInsets.only(bottom: paddingTopAndBottom)),
          Text(
            '$numberToPlot',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeColors.blueGrey,
              shadows: [
                Shadow(
                  color: ThemeColors.black.withOpacity(shadowOpacity),
                  offset: shadowOffset,
                  blurRadius: blurRadius,
                ),
              ],
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class BuildIcon extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;

  const BuildIcon({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    double topIconElevation = 8.0;

    return Material(
      shadowColor: ThemeColors.lightGreen,
      elevation: topIconElevation,
      shape: const CircleBorder(
        side: BorderSide(color: ThemeColors.lightGreen),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ThemeColors.lightGreen.withOpacity(0.15),
            shape: BoxShape.circle,
            border: Border.all(color: ThemeColors.lightGreen),
          ),
          child: Center(child: Icon(icon)),
        ),
      ),
    );
  }
}
