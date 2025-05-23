import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.containerColor,
    required this.textColor,
    this.heightCont = 30,
    this.width = 105,
  });
  final String title;
  final Function() onPressed;
  final Color containerColor;
  final Color textColor;
  final double heightCont;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightCont,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          alignment: AlignmentDirectional.center,
          disabledBackgroundColor: MyColors.black,
          backgroundColor: containerColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            //fontFamily: AppConst.fontFamilyLeague,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
