import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AutoContainer(),
      ),
    );

class AutoContainer extends StatefulWidget {
  const AutoContainer({Key? key}) : super(key: key);

  @override
  State<AutoContainer> createState() => _AutoContainerState();
}

class _AutoContainerState extends State<AutoContainer> {
  ///specifying properties that would be animated when the setState is called
  double height = 50;
  double width = 50;
  Color buttonColor = Colors.black;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Polymorph'),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: AnimatedContainer(
          ///assigning those properties to the AnimatedContainer
          ///the AnimatedContainer have the duration and curve property to add time and curve to the animation
          width: width,
          height: height,
          decoration:
              BoxDecoration(color: buttonColor, borderRadius: borderRadius),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                ///calling the setState to change its value and randomizing the properties
                final random = Random();

                ///setting the width,height to generate an integer greater than 50px but less than 400px and converting it to a double
                int max = 400;
                int min = 50;
                width = min + random.nextInt(max - min).toDouble();
                height = min + random.nextInt(max - min).toDouble();

                ///setting the RGBO properties to random colors setting the opacity to 1 that is fully opaque
                buttonColor = Color.fromRGBO(random.nextInt(256),
                    random.nextInt(256), random.nextInt(256), 1);

                ///doing the same to the border and we can specify a range to be able to randomize it like
                ///from 50-100 randomize the radius between this range
                borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
                print('width-Hight = ${random.nextInt(max - min).toDouble()}');
                print('color = ${random.nextInt(256).toDouble()}');
              });
            },
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}
