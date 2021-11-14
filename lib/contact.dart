import 'dart:html' as html;

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/navBars.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    currentScreen = "contactus";
    super.initState();
  }

  void _launchMailClient() async {
    const mailUrl = 'mailto:mv.thebookshelf@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: navbar(size, context),
      body: Container(
        height: size.height,
        decoration: new BoxDecoration(
          color: mainColor.withOpacity(0.2),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              mainColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            image: AssetImage('assets/bookshelfBackground5.jpeg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: size.longestSide * 0.03,
                    fontWeight: FontWeight.w500,
                    color: secondColor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "If you have any questions please reach out to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontSize: size.longestSide * 0.014,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _launchMailClient();
                    },
                    child: Text(
                      "mv.thebookshelf@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        decorationColor: secondColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.7,
                        fontSize: size.longestSide * 0.017,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        // await launchMailto();
                        _launchMailClient();
                      },
                      icon: Icon(
                        Icons.email,
                        color: secondColor,
                        size: size.longestSide * 0.025,
                      ),
                      iconSize: size.longestSide * 0.025,
                      hoverColor: mainColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    IconButton(
                      onPressed: () {
                        var html;
                        html.window.open(
                            'https://www.instagram.com/mvbookshelf/', "_blank");
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: secondColor,
                        size: size.longestSide * 0.025,
                      ),
                      iconSize: size.longestSide * 0.025,
                      hoverColor: mainColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    IconButton(
                      onPressed: () {
                        html.window.open(
                            'https://github.com/RhinoInani/MvBookshelfWebsite',
                            "_blank");
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        color: secondColor,
                        size: size.longestSide * 0.025,
                      ),
                      iconSize: size.longestSide * 0.025,
                      hoverColor: mainColor.withOpacity(0.3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
