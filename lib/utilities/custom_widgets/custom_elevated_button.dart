import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.backGroundColor,
    this.foreGroundColor,
  }) : super(key: key);

  final String title;
  final void Function() onTap;
  final Color? backGroundColor;
  final Color? foreGroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor ?? Colors.transparent,
          foregroundColor: foreGroundColor ?? Colors.black,
          side: BorderSide(width: 1, color: backGroundColor ?? Colors.black54),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
