import 'package:flutter/material.dart';

import '../constants.dart';

ButtonStyle highlightButtonStyle() {
  return ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.black;
      if (states.contains(MaterialState.hovered)) return Colors.black;
      if (states.contains(MaterialState.pressed)) return Colors.black;
      return secondColor;
    }),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.size,
    required this.title,
    required this.checkNamed,
    required this.pushNamed,
  }) : super(key: key);

  final Size size;
  final String title;
  final String checkNamed;
  final String pushNamed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      child: TextButton(
        onPressed: () {
          if (currentScreen != "$checkNamed") {
            Navigator.of(context).pushNamed('$pushNamed');
          }
          currentScreen = "$checkNamed";
        },
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: highlightButtonStyle(),
      ),
    );
  }
}
