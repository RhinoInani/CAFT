import 'package:flutter/material.dart';

import 'components/navBars.dart';
import 'constants.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      title: "Upcoming Events",
      color: Colors.black,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            PagesSliverAppBar(size: size),
            CollapsingHeader(
              size: size,
              imagePath: 'assets/caftBack3.png',
              title: 'Upcoming Events',
              fontColor: secondColor,
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
                        child: UpcomingEventsCard(
                          title: '${eventHeaders[index]}',
                          date: 'To Be Announced',
                          bodyText: '${eventBody[index]}',
                          buttonPress: () {},
                          button: false,
                          size: size,
                        ));
                  } else {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.longestSide * 0.01,
                          horizontal: size.longestSide * 0.02,
                        ),
                        child: UpcomingEventsCard(
                          title: '${eventHeaders[index]}',
                          date: 'To Be Announced',
                          bodyText: '${eventBody[index]}',
                          buttonPress: () {},
                          button: false,
                          size: size,
                        ));
                  }
                },
                childCount: eventHeaders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingEventsCard extends StatelessWidget {
  const UpcomingEventsCard({
    Key? key,
    required this.size,
    required this.title,
    required this.bodyText,
    required this.date,
    required this.button,
    required this.buttonPress,
  }) : super(key: key);

  final Size size;
  final String title;
  final String bodyText;
  final String date;
  final bool button;
  final Function buttonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "$title",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: size.longestSide * 0.02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  date == ''
                      ? Container()
                      : Text(
                          "$date",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.longestSide * 0.014,
                          ),
                        ),
                  button
                      ? OutlinedButton(
                          onPressed: () {
                            buttonPress.call();
                          },
                          child: Text(
                            "More information",
                            style: TextStyle(
                              color: secondColor,
                              fontSize: size.longestSide * 0.014,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(color: mainColor),
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width * 0.9,
            child: Text(
              "$bodyText",
              style: TextStyle(fontSize: size.longestSide * 0.016),
            ),
          ),
        ],
      ),
    );
  }
}
