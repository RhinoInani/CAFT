import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/buttonStyles.dart';
import 'components/navBars.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: navbar(size, context),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: size.height - size.height * 0.08,
            width: size.width,
            decoration: new BoxDecoration(
              color: mainColor.withOpacity(0.2),
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                  mainColor.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
                image: AssetImage('assets/caftBack4.jpg'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "404 Page not found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: secondColor,
                    decorationThickness: 0.7,
                    color: mainColor,
                    fontSize: size.longestSide * 0.034,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Sorry this page has not been set up yet.\nPlease try again later.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.longestSide * 0.017,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: size.width * 0.02,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
