import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '/models/orbit_model.dart';

class OrbitPainter extends CustomPainter {
  final Orbit orbit;

  OrbitPainter(this.orbit);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    Path orbitPath = Path();

    final width = size.shortestSide;
    final height = width * 0.24;

    orbitPath
        .addOval(Rect.fromCenter(center: center, width: width, height: height));

    canvas.drawPath(
      orbitPath,
      Paint()
        ..color = const Color(0xFF26224f)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    for (var electron in orbit.electrons) {
      electron.currentSize =
          lerpDouble(electron.currentSize, electron.targetSize, 0.08)!;
      electron.currentColor =
          Color.lerp(electron.currentColor, electron.targetColor, 0.08)!;
      final degree = pi * 2 * electron.positionPercent;
      canvas.drawCircle(
        center +
            Offset(
              cos(degree) * (width / 2),
              sin(degree) * (height / 2),
            ),
        electron.currentSize / 2,
        Paint()
          ..color = electron.currentColor
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round
          ..strokeWidth = electron.currentSize,
      );
    }
  }

  @override
  bool shouldRepaint(covariant OrbitPainter oldDelegate) => true;
}
