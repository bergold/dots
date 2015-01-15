library dots.driver;

import 'dart:html' as html;
import 'package:dots/dots.dart';

class Driver {

  bool _running = false;
  num _previoustimestamp = -1;
  final World world;

  Driver(this.world);

  void start() {
    _running = true;
    html.window.animationFrame.then((timestamp) {
      _previoustimestamp = timestamp;
      if (_running) _step();
    });
  }

  void stop() {
    _running = false;
  }

  void reset() {
    stop();
    world.reset();
  }

  void _step() {
    html.window.animationFrame.then((timestamp) {
      var dt = timestamp - _previoustimestamp;
      world.step(dt);
      _previoustimestamp = timestamp;
      if (_running) _step();
    });
  }

}
