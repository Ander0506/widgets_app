import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {

  static const String name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50.0;
  double height = 50.0;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    setState(() {
      // width = (random.nextDouble() * 300) + 50.0;
      width = random.nextInt(300) + 50;
      height = random.nextInt(500) + 50;
      borderRadius = random.nextInt(100) + 10;
      color = Color.fromRGBO(
        random.nextInt(255),  //red
        random.nextInt(255),   //green
        random.nextInt(255),  //blue
        random.nextDouble() //opacity
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration( milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width <= 0 ? 50 : width,
          height: height <= 0 ? 50 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}