import 'package:flutter/material.dart';
import 'package:kasir_app/core/constants/app_colors.dart';

class QButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  final IconData? sufixIcon;
  final Color? color;
  final bool spaceBetween;

  final double? fontSize;

  QButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.icon,
    this.sufixIcon,
    this.color,
    this.spaceBetween = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? MediaQuery.of(context).size.width;
    double widgetHeight = 51.0;
    double widgetFontSize = 15.0;
    double widgetIconSize = 24.0;

    widgetHeight = height ?? widgetHeight;

    return Container(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon!,
                size: widgetIconSize,
              ),
              SizedBox(
                width: 6.0,
              ),
            ],
            if (spaceBetween && icon != null) Spacer(),
            Text(
              label,
              style: TextStyle(
                  fontSize: fontSize ?? widgetFontSize, color: Colors.white),
            ),
            if (spaceBetween && sufixIcon != null) Spacer(),
            if (sufixIcon != null) ...[
              Icon(
                sufixIcon!,
                size: widgetIconSize,
              ),
              SizedBox(
                width: 6.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
