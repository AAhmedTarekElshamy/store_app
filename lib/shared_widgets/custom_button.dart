import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
    CustomButton({super.key, required this.text,required this.onTab});
  final String text;
 final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
