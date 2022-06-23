import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbtmi/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            child,
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/contents_appbar.png",
                width: size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
