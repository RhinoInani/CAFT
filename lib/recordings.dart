import 'package:caft/aboutus.dart';
import 'package:caft/constants.dart';
import 'package:flutter/material.dart';

import 'components/navBars.dart';

class Resources extends StatelessWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "Resources",
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            PagesSliverAppBar(size: size),
            CollapsingHeader(
              size: size,
              imagePath: 'assets/caftBack4.jpg',
              title: 'Recordings',
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
                        imageWidth: size.longestSide * 0.15,
                        bodyText: recordingBody[index],
                        imagePath: "${recordingImages[index]}",
                        flipped: index % 2 == 1,
                        headerText: recordingHeaders[index],
                        link: recordingLinks[index],
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
                        imageHeight: size.longestSide * 0.2,
                        imageWidth: size.longestSide * 0.15,
                        bodyText: recordingBody[index],
                        imagePath: "${recordingImages[index]}",
                        flipped: index % 2 == 1,
                        headerText: recordingHeaders[index],
                        link: recordingLinks[index],
                      ),
                    );
                  }
                },
                childCount: recordingImages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
