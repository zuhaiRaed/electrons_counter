import 'dart:math';

import 'package:flutter/material.dart';

import '/style/style.dart';
import 'orbit_model.dart';

class Electron {
  double speed;

  double currentSize;
  double targetSize;

  Color currentColor;
  Color targetColor;


  ////asd 

  double _positionPercent = 0;

  double get positionPercent {
    return _positionPercent;
  }

  Electron({
    required this.currentSize,
    required this.targetSize,
    required this.currentColor,
    required this.targetColor,
    required this.speed,
  });

  void move() {
    if (_positionPercent >= 1.0) {
      _positionPercent = 0;
    }
    _positionPercent += speed;
  }

  static Electron random() {
    const colors = [
      Style.greenAccent,
      Style.purpleAccent,
      Style.cyanAccent,
      Style.yellowAccent,
      Style.redAccent,
    ];
    final size = randomDouble(5, 7);
    final initialSize = size * 8;
    final color = colors[Random().nextInt(colors.length)];
    return Electron(
      currentSize: initialSize,
      targetSize: size,
      currentColor: color.withOpacity(0.1),
      targetColor: color,
      speed: randomDouble(0.008, 0.012),
    );
  }
}
