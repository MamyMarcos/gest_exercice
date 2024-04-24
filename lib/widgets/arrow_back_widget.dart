import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 48,
        height: 48,
        child: SvgPicture.asset(
          'assets/arrow-back.svg',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
