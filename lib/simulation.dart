library simulation;

import 'dart:html';
import 'dart:async';
import 'dots.dart';

class Simulation {

  final HtmlElement container;
  World _world;
  bool running;

  /// Events.
  final StreamController _onSetup = new StreamController();
  Stream get onSetup => _onSetup.stream;

  Simulation(this.container);

  void run() {
    _world = new World();
    _onSetup.add(_world);
    running = true;
  }

  void step(timestamp) {

  }

}
