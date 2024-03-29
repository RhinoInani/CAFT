import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/navBars.dart';
import 'constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.black,
      title: "About Us",
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            PagesSliverAppBar(size: size),
            CollapsingHeader(
              size: size,
              imagePath: 'assets/caftBack2.jpg',
              title: 'About Us',
              fontColor: mainColor,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: size.longestSide * 0.03,
                        bottom: size.longestSide * 0.01,
                        left: size.longestSide * 0.02,
                        right: size.longestSide * 0.02,
                      ),
                      child: AboutUsCard(
                        size: size,
                        imageHeight: size.longestSide * 0.07,
                        imageWidth: size.longestSide * 0.07,
                        bodyText: aboutUsBody[index],
                        imagePath: "assets/books-pngrepo-com.png",
                        flipped: index % 2 == 1,
                        headerText: aboutUsHeaders[index],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * 0.01,
                        horizontal: size.longestSide * 0.02,
                      ),
                      child: AboutUsCard(
                        size: size,
                        imageHeight: size.longestSide * 0.07,
                        imageWidth: size.longestSide * 0.07,
                        bodyText: aboutUsBody[index],
                        imagePath: "assets/books-pngrepo-com.png",
                        flipped: index % 2 == 1,
                        headerText: aboutUsHeaders[index],
                      ),
                    );
                  }
                },
                childCount: aboutUsHeaders.length,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * 0.01,
                        horizontal: size.longestSide * 0.02,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Our Team",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontSize: size.longestSide * 0.024,
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: mainColor,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          OurTeamCard(
                              name: ourTeamName[index],
                              position: ourTeamPosition[index]),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * 0.01,
                        horizontal: size.longestSide * 0.02,
                      ),
                      child: OurTeamCard(
                          name: ourTeamName[index],
                          position: ourTeamPosition[index]),
                    );
                  }
                },
                childCount: ourTeamName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({
    Key? key,
    required this.size,
    required this.imageHeight,
    required this.imageWidth,
    required this.bodyText,
    required this.imagePath,
    required this.flipped,
    required this.headerText,
    this.link,
  }) : super(key: key);

  final Size size;
  final double imageHeight;
  final double imageWidth;
  final String bodyText;
  final String imagePath;
  final bool flipped;
  final String headerText;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      child: flipped
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: size.longestSide * 0.017),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "$bodyText",
                        style: TextStyle(fontSize: size.longestSide * 0.012),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (link!.length > 0) {
                      html.window.open('${link!}', "_blank");
                    }
                  },
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(size.longestSide * 0.005),
                    child: Image.asset(
                      '$imagePath',
                      fit: BoxFit.fitWidth,
                      // height: imageHeight,
                      width: imageWidth,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (link!.length > 0) {
                      html.window.open('${link!}', "_blank");
                    }
                  },
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius:
                        BorderRadius.circular(size.longestSide * 0.005),
                    child: Image.asset(
                      '$imagePath',
                      fit: BoxFit.fitWidth,
                      // height: imageHeight,
                      width: imageWidth,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: size.longestSide * 0.017),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "$bodyText",
                        style: TextStyle(fontSize: size.longestSide * 0.012),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class OurTeamCard extends StatelessWidget {
  final String name;
  final String position;
  const OurTeamCard({Key? key, required this.name, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name:",
                style: TextStyle(
                    color: mainColor, fontSize: size.longestSide * 0.017),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "$position",
                style: TextStyle(
                    fontSize: size.longestSide * 0.017, color: Colors.black),
              ),
            ],
          ),
        ),
      ]),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
