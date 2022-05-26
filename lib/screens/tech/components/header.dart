import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';

class Header extends StatelessWidget {
  final String text;
  final Duration delay;
  const Header({
    Key? key,
    required this.text,
    this.delay = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearAnimation(
      delay: delay,
      child: SizedBox(
        width: 200.0,
        child: Text(
          '${text} >',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
