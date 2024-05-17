import 'dart:async';
import 'dart:math';

import '/models/orbit_model.dart';
import 'package:flutter/material.dart';

import '/style/style.dart';
import 'orbit_painter.dart';

class AtomWidget extends StatefulWidget {
  final List<Orbit> orbits;

  const AtomWidget({Key? key, required this.orbits}) : super(key: key);

  @override
  State<AtomWidget> createState() => _AtomWidgetState();
}

class _AtomWidgetState extends State<AtomWidget>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        widget.orbits.updateElectronsPosition();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final atomSize = (MediaQuery.of(context).size.shortestSide / 3) * 2;
    return Stack(
      children: [
        ...widget.orbits
            .map(
              (orbit) => Center(
                child: Transform.rotate(
                  angle: degreesToRads(orbit.angle),
                  child: CustomPaint(
                    painter: OrbitPainter(orbit),
                    size: Size(atomSize, atomSize),
                  ),
                ),
              ),
            )
            .toList(),
        Center(
          child: Container(
            width: atomSize / 10,
            height: atomSize / 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Style.orangeGradiant,
                  Style.redGradiant,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

double degreesToRads(double deg) {
  return (deg * pi) / 180.0;
}
