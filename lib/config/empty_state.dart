import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStateSvg extends StatelessWidget {
  final String image;
  const EmptyStateSvg({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 60,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
