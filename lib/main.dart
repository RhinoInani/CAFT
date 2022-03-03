import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caft/aboutus.dart';
import 'package:caft/constants.dart';
import 'package:caft/pageNotFound.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'components/navBars.dart';
import 'contact.dart';
import 'events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (contact) => HomePage(),
        '/about-us': (context) => AboutUs(),
        '/events': (context) => UpcomingEvents(),
        '/contact-us': (context) => ContactUs(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return PageNotFound();
        });
      },
      theme: ThemeData(
        textTheme: GoogleFonts.ebGaramondTextTheme(),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: mainColor,
          secondary: secondColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> imgList = [
    'assets/caftBack1.jpg',
    'assets/caftBack2.jpg',
    'assets/caftBack3.png',
    'assets/caftBack4.jpg',
    'assets/caftBack5.jpg',
  ];

  double offset = 0;
  late ScrollController scrollController;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _controller2,
    curve: Curves.ease,
  );
  late final AnimationController _controller3 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation3 = CurvedAnimation(
    parent: _controller3,
    curve: Curves.ease,
  );
  late final AnimationController _controller4 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation4 = CurvedAnimation(
    parent: _controller4,
    curve: Curves.ease,
  );
  late final AnimationController _controller5 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation5 = CurvedAnimation(
    parent: _controller5,
    curve: Curves.ease,
  );
  late final AnimationController _controller6 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation6 = CurvedAnimation(
    parent: _controller6,
    curve: Curves.ease,
  );
  late final AnimationController _controller7 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<double> _animation7 = CurvedAnimation(
    parent: _controller7,
    curve: Curves.ease,
  );

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
      });
      double add = size.height * 0.3;
      if (offset >= size.height * 0.45) _controller.forward();
      if (offset >= size.height * 0.45 + add) _controller2.forward();
      if (offset >= size.height * 0.45 + (add * 2)) _controller3.forward();
      if (offset >= size.height * 0.45 + (add * 3)) _controller4.forward();
      if (offset >= size.height * 0.45 + (add * 4)) _controller5.forward();
      if (offset >= size.height * 0.45 + (add * 5)) _controller6.forward();
      if (offset >= size.height * 0.45 + (add * 6.5)) _controller7.forward();
    });

    return Title(
      title: "CAFT",
      color: Colors.black,
      child: Scaffold(
        appBar: navbar(size, context),
        backgroundColor: mainColor.withOpacity(0.7),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: IgnorePointer(
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: size.height,
                            autoPlay: true,
                            pageSnapping: false,
                            disableCenter: true,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3, milliseconds: 500)),
                        items: imgList
                            .map(
                              (item) => Container(
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
                                      item,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.4,
                    left: size.width * 0.3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Classic Awareness for",
                          style: TextStyle(
                            color: secondColor,
                            fontSize: size.longestSide * 0.04,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: size.longestSide * 0.01,
                        ),
                        // Text(
                        //   "Teens",
                        //   style: TextStyle(
                        //     color: mainColor,
                        //     fontSize: size.longestSide * 0.04,
                        //   ),
                        // ),
                        DefaultTextStyle(
                          style: GoogleFonts.ebGaramond(
                            fontSize: size.longestSide * 0.04,
                            color: mainColor,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: const Duration(milliseconds: 800),
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              FadeAnimatedText('Teens'),
                              FadeAnimatedText('Children'),
                              FadeAnimatedText('All'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    child: WaveWidget(
                      config: CustomConfig(
                        colors: [mainColor],
                        durations: [1000000],
                        heightPercentages: [0.5],
                      ),
                      waveAmplitude: size.height * 0.013,
                      waveFrequency: 2,
                      size: Size(
                        size.width,
                        size.height * 0.2,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        mainColor,
                        Color.fromRGBO(15, 40, 87, 0.9098039215686274),
                      ]),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          left: size.width * 0.35,
                          child: FadeTransition(
                            opacity: _animation,
                            child: TimelineCard(
                              size: size,
                              title: "The Primary Mission",
                              body:
                                  "Create a warm atmosphere where students of underprivileged schools can learn about the intricate fields of classical literature and history.",
                              imagePath: "assets/books-pngrepo-com.png",
                              leftImage: true,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.27,
                          left: size.width * 0.06,
                          child: FadeTransition(
                            opacity: _animation2,
                            child: TimelineCard(
                              size: size,
                              title: "Our Goals",
                              body:
                                  "CAFT aims to provide opportunities to its members to learn and appreciate Classical languages, art, literature, and laws.",
                              imagePath: "assets/books-pngrepo-com.png",
                              leftImage: false,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.54,
                          left: size.width * 0.35,
                          child: FadeTransition(
                            opacity: _animation3,
                            child: TimelineCard(
                              size: size,
                              title: "Resources",
                              body:
                                  "CAFT will provide resources to students to help educate them about classic history and literature, along with promoting student interesting in Classical Antiquity.",
                              imagePath: "assets/books-pngrepo-com.png",
                              leftImage: true,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.805,
                          left: size.width * 0.06,
                          child: FadeTransition(
                            opacity: _animation4,
                            child: TimelineCard(
                              size: size,
                              title: "Open Community",
                              body:
                                  "We celebrate diversity in all of its forms, consciously recognizing that these difference will result in the best ideas. We will ensure that everyone feels respected and part of the learning process.",
                              imagePath: "assets/books-pngrepo-com.png",
                              leftImage: false,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 1.08,
                          left: size.width * 0.35,
                          child: FadeTransition(
                            opacity: _animation5,
                            child: TimelineCard(
                              size: size,
                              title: "Have Fun",
                              body:
                                  "We want to ensure that members focus as much on the journey as they do the results for our proposed events, for the journey is the most important and enjoyable part! ",
                              imagePath: "assets/books-pngrepo-com.png",
                              leftImage: true,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: CustomPaint(
                              size: Size(
                                size.width * 0.1,
                                size.height * 1.35,
                              ),
                              painter: ShapePrinter(),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   child: WaveWidget(
                        //     config: CustomConfig(
                        //       colors: [
                        //         Color.fromRGBO(15, 40, 87, 0.9098039215686274)
                        //       ],
                        //       durations: [1000000],
                        //       heightPercentages: [0.5],
                        //     ),
                        //     waveAmplitude: size.height * 0.03,
                        //     waveFrequency: 2,
                        //     size: Size(
                        //       size.width,
                        //       size.height * 0.2,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    FadeTransition(
                      opacity: _animation6,
                      child: ExtraInformation(
                        size: size,
                        containerBody: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Why Us?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: mainColor),
                              ),
                            ),
                            BulletText(
                                text:
                                    "We provide leadership opportunities and experiences"),
                            BulletText(
                                text:
                                    "Skill Building and Networking opportunities"),
                            BulletText(text: "Discover and build passion"),
                            BulletText(
                                text:
                                    "The ability to work with a team of motivated and dedicated people"),
                            BulletText(text: "Diversity of experience"),
                          ],
                        ),
                        imagePath: 'assets/caftBack4.jpg',
                        flipped: false,
                      ),
                    ),
                    FadeTransition(
                      opacity: _animation7,
                      child: ExtraInformation(
                        size: size,
                        containerBody: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Upcoming Events",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: mainColor),
                              ),
                            ),
                            BulletText(text: "Providing Resources"),
                            BulletText(
                                text:
                                    "Professor, Teachers, and Student Writing"),
                            BulletText(text: "Field Trips to Museums"),
                            BulletText(text: "Reading and Writing Workshops"),
                            BulletText(text: "Out Reach"),
                          ],
                        ),
                        imagePath: 'assets/caftBack1.jpg',
                        flipped: true,
                      ),
                    ),
                    WaveWidget(
                      config: CustomConfig(
                        gradients: [
                          [
                            mainColor,
                            Color.fromRGBO(15, 40, 87, 0.9098039215686274),
                          ]
                        ],
                        gradientBegin: Alignment.centerLeft,
                        gradientEnd: Alignment.centerRight,
                        durations: [1000000],
                        heightPercentages: [0.6],
                      ),
                      waveAmplitude: size.height * 0.013,
                      waveFrequency: 2,
                      size: Size(
                        size.width,
                        size.height * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExtraInformation extends StatelessWidget {
  const ExtraInformation({
    Key? key,
    required this.size,
    required this.containerBody,
    required this.imagePath,
    required this.flipped,
  }) : super(key: key);

  final Size size;
  final Column containerBody;
  final String imagePath;
  final bool flipped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.2,
        right: size.width * 0.05,
        left: size.width * 0.05,
      ),
      child: flipped
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        mainColor.withOpacity(0.8),
                        BlendMode.dstATop,
                      ),
                      image: AssetImage(
                        "$imagePath",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: size.width * 0.4,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: containerBody,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: size.width * 0.4,
                  height: size.height * 0.31,
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: containerBody,
                ),
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        mainColor.withOpacity(0.8),
                        BlendMode.dstATop,
                      ),
                      image: AssetImage(
                        "$imagePath",
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class BulletText extends StatelessWidget {
  const BulletText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\u2022 $text",
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
    );
  }
}

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    Key? key,
    required this.size,
    required this.title,
    required this.body,
    required this.imagePath,
    required this.leftImage,
  }) : super(key: key);

  final Size size;
  final String title;
  final String body;
  final String imagePath;
  final bool leftImage;

  @override
  Widget build(BuildContext context) {
    return leftImage
        ? Row(
            children: [
              SizedBox(
                width: size.width * 0.04,
              ),
              Image.asset(
                "$imagePath",
                height: size.longestSide * 0.07,
                width: size.longestSide * 0.07,
              ),
              SizedBox(
                width: size.width * 0.09,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.longestSide * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.3,
                    // height: size.height * 0.13,
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Text(
                      "$body",
                      style: TextStyle(
                        fontSize: size.longestSide * 0.015,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : Row(
            children: [
              SizedBox(
                width: size.width * 0.09,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.longestSide * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.3,
                    // height: size.height * 0.13,
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Text(
                      "$body",
                      style: TextStyle(
                        fontSize: size.longestSide * 0.015,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Image.asset(
                "$imagePath",
                height: size.longestSide * 0.07,
                width: size.longestSide * 0.07,
              ),
            ],
          );
  }
}

class ShapePrinter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    double yOffset = size.height * 0.014;
    double spaceBetween = size.height / 5;
    int counter = 0;
    var paintLine = Paint()
      ..color = secondColor
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    var paintCircle = Paint()
      ..color = mainColor.withRed(125)
      ..strokeWidth = 10;

    var paintOuterLines = Paint()
      ..color = Colors.black54
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(size.width / 2, 0);
    Offset endingPoint = Offset(size.width / 2, size.height);

    canvas.drawLine(startingPoint, endingPoint, paintLine);
    while (yOffset <= size.height) {
      canvas.drawCircle(Offset(size.width / 2, yOffset), 10, paintCircle);
      counter % 2 == 0
          ? canvas.drawLine(Offset(size.width / 2 + 15, yOffset),
              Offset(size.width - 10, yOffset), paintOuterLines)
          : canvas.drawLine(Offset(size.width / 2 - 15, yOffset),
              Offset(10, yOffset), paintOuterLines);
      counter++;
      yOffset += spaceBetween;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
