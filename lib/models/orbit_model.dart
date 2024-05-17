import 'dart:math';

import 'electron_model.dart';

double randomDouble(double min, double max) =>
    Random().nextDouble() * (max - min) + min;

class Orbit {
  final List<Electron> electrons;
  final double angle;

  Orbit({
    required this.electrons,
    required this.angle,
  });
}

extension OrbitsExtension on List<Orbit> {
  void updateElectronsPosition() {
    forEach((orbit) {
      for (var electron in orbit.electrons) {
        electron.move();
      }
    });
  }
}
