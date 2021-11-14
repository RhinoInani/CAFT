import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'buttonStyles.dart';

AppBar navbar(Size size, BuildContext context) {
  return AppBar(
    backgroundColor: mainColor,
    elevation: 0,
    leadingWidth: size.width * 0.3,
    toolbarHeight: size.height * 0.09,
    leading: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (currentScreen != "home") {
            Navigator.of(context).pushNamed('/');
          }
          currentScreen = "home";
        },
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    ),
    actions: [
      NavBarButton(
        size: size,
        title: 'Home',
        checkNamed: "home",
        pushNamed: "/",
      ),
      NavBarButton(
        size: size,
        title: 'About Us',
        checkNamed: "aboutus",
        pushNamed: "/about-us",
      ),
      NavBarButton(
        size: size,
        title: 'Upcoming Events',
        checkNamed: "events",
        pushNamed: "/events",
      ),
      // NavBarButton(
      //   size: size,
      //   title: 'Resources',
      //   checkNamed: "resources",
      //   pushNamed: "/resources",
      // ),
      NavBarButton(
        size: size,
        title: 'Contact Us',
        checkNamed: "contactus",
        pushNamed: "/contact-us",
      ),
      // NavBarButton(
      //   size: size,
      //   title: 'Join Us',
      //   checkNamed: "join",
      //   pushNamed: "/join",
      // ),
    ],
  );
}

class PagesSliverAppBar extends StatelessWidget {
  const PagesSliverAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: mainColor,
      elevation: 0,
      leadingWidth: size.width * 0.3,
      toolbarHeight: size.height * 0.09,
      leading: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (currentScreen != "home") {
              Navigator.of(context).pushNamed('/');
            }
            currentScreen = "home";
          },
          child: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
      actions: [
        NavBarButton(
          size: size,
          title: 'Home',
          checkNamed: "home",
          pushNamed: "/",
        ),
        NavBarButton(
          size: size,
          title: 'About Us',
          checkNamed: "aboutus",
          pushNamed: "/about-us",
        ),
        NavBarButton(
          size: size,
          title: 'Upcoming Events',
          checkNamed: "events",
          pushNamed: "/events",
        ),
        // NavBarButton(
        //   size: size,
        //   title: 'Resources',
        //   checkNamed: "resources",
        //   pushNamed: "/resources",
        // ),
        NavBarButton(
          size: size,
          title: 'Contact Us',
          checkNamed: "contactus",
          pushNamed: "/contact-us",
        ),
        // NavBarButton(
        //   size: size,
        //   title: 'Join Us',
        //   checkNamed: "join",
        //   pushNamed: "/join",
        // ),
      ],
    );
  }
}

class CollapsingHeader extends StatelessWidget {
  const CollapsingHeader({
    Key? key,
    required this.size,
    required this.title,
    required this.fontColor,
    required this.imagePath,
  }) : super(key: key);

  final Size size;
  final String title;
  final Color fontColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: Text(
          "$title",
          style: GoogleFonts.ebGaramond(
            fontWeight: FontWeight.bold,
            color: fontColor,
            fontSize: size.longestSide * 0.024,
          ),
        ),
        background: Container(
          padding: EdgeInsets.zero,
          width: size.width,
          decoration: BoxDecoration(
            color: mainColor.withOpacity(0.2),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                mainColor.withOpacity(0.6),
                BlendMode.dstATop,
              ),
              image: AssetImage(
                "$imagePath",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
