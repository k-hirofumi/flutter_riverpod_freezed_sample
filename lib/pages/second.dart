import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(174, 214, 213, 222),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('てきすとえりあ'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(176, 232, 226, 230),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 230.h,
                child: Stack(
                  children: [
                    Shake(front: true),
                    Positioned(
                      top: 50.h,
                      left: 40.w,
                      child: Strech(front: true),
                    ),
                    Positioned(
                      top: 100.h,
                      left: 80.w,
                      child: Shake(front: true),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Strech(front: false),
                    ),
                    Positioned(
                      top: 50.h,
                      right: 40.w,
                      child: Shake(front: false),
                    ),
                    Positioned(
                      top: 100.h,
                      right: 80.w,
                      child: Shake(front: false),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

//横ゆれ
class Shake extends StatefulWidget {
  const Shake({super.key, required this.front});
  final bool front; //アバターの向き
  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: -0.1, end: 0.1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform: Matrix4.skewX(_animation.value),
          alignment: FractionalOffset.bottomCenter,
          child: widget.front
              ? Atached()
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: Atached(),
                ),
        );
      },
    );
  }
}

//縦ゆれ
class Strech extends StatefulWidget {
  const Strech({super.key, required this.front});
  final bool front; //アバターの向き
  @override
  _StrechState createState() => _StrechState();
}

class _StrechState extends State<Strech> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: 0.3, end: 0.35).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Transform(
            transform: Matrix4.diagonal3(vector.Vector3(
                1.0,
                _animation.value * 3,
                1.0)), // This applies the scaling only in the y direction.
            alignment: FractionalOffset.bottomCenter,
            child: widget.front
                ? Atached()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Atached(),
                  ),
          );
        });
  }
}

//画像の合成
class Atached extends StatelessWidget {
  const Atached({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.black,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      height: 120.h,
      width: 120.w,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/moru1.png',
              width: 500,
              height: 350,
            ),
            Positioned(
              top: 0,
              left: 260,
              child: Image.asset(
                'assets/images/cap.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
