import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive.dart';

class Catchphrase extends StatelessWidget {
  const Catchphrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AllLayout();
  }
}

class AllLayout extends StatelessWidget {
  const AllLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '“',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontSize: Responsive.isDesktop(context) ? 20.0 : 20.0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: Text(
            'about1'.tr().replaceAll('\n', ' '),
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: Responsive.isDesktop(context) ? 20.0 : 14.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Text(
          '”',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontSize: Responsive.isDesktop(context) ? 30.0 : 20.0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}
