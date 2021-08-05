import 'package:example/circular_painter.dart';
import 'package:flutter/material.dart';

import 'circle_progress_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Animated Circle Progress"),
      ),
      body: Center(
        child: ProgressCard(),
      ),
    );
  }
}

class ProgressCard extends StatefulWidget {
  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> with TickerProviderStateMixin{
  double progressPercent = 0;
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Color foreground = Colors.red;

    if (progressPercent >= 0.8) {
      foreground = Colors.green;
    } else if (progressPercent >= 0.4) {
      foreground = Colors.orange;
    }

    Color background = foreground.withOpacity(0.2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleProgressBar(
                    backgroundColor: Color(0x22D4D6DA),
                    foregroundColor: Colors.black,
                    value: this.progressPercent,
                  ),
                  Container(
                    width: 50,
                    child: CustomPaint(
                      painter: OpenPainter(),
                    ),
                  )
                ],
              ),
              onTap: () {

                final updated = ((this.progressPercent + 0.1).clamp(0.0, 1.0) *
                    100);
                print('update : $updated');
                controller = AnimationController(
                    duration: const Duration(milliseconds: 500), vsync: this);
                sizeAnimation =  Tween<double>(begin: this.progressPercent, end: (updated.round() / 100)).animate(controller)..addListener(() {
                  setState(() {
                    this.progressPercent = sizeAnimation.value;
                  });
                });
                controller.forward();
                print(this.progressPercent);

              },
            ),
          ),
        ),
      ],
    );
  }
}

