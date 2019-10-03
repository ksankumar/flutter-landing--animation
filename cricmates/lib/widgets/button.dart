import 'package:flutter/material.dart';
import 'package:cricmates/utils/colors.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/utils/styles.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(ScreenSize.sizeSmall),
  );

  final bool enabled;

  AppButton({
    @required this.onTap,
    @required this.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: _borderRadius,
      onTap: enabled ? onTap : () {},
      child: Container(
        padding: EdgeInsets.all(ScreenSize.sizeMedium),
        child: Center(
          child: Text(
            text,
            style: TextStyles.buttonText,
          ),
        ),
        decoration: BoxDecoration(
          color: enabled ? AppColors.primary : Colors.grey,
          borderRadius: _borderRadius,
        ),
      ),
    );
  }
}
