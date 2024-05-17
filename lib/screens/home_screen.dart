import 'dart:math';

import 'package:flutter/material.dart';

import '/models/electron_model.dart';
import '/models/orbit_model.dart';
import '/widgets/atom_widget.dart';
import '../style/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Orbit> orbits = [
      Orbit(electrons: [], angle: 0.0),
      Orbit(electrons: [], angle: 60.0),
      Orbit(electrons: [], angle: 120.0),
    ];
    return Scaffold(
      backgroundColor: Style.background,
      body: Center(
        child: AtomWidget(orbits: orbits),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                orbits[Random().nextInt(orbits.length)]
                    .electrons
                    .add(Electron.random());
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              onPressed: () {
                orbits[Random().nextInt(orbits.length)].electrons.clear();
              },
              backgroundColor: Colors.red.withOpacity(0.8),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
