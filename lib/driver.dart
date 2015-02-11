library dots.driver;

import 'dart:html' as html;
import 'package:dots/dots.dart';
import 'package:dots/render.dart';

class Driver {

  bool _running = false;
  num _previoustimestamp = -1;
  Render render;
  final World world;

  num timeScale = 1;

  Driver(this.world, [this.render]) {
    world.setup();
    if (render != null) render.render();
  }

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
    if (render != null) render.render();
  }

  void _step() {
    html.window.animationFrame.then((timestamp) {
      var dt = (timestamp - _previoustimestamp) / 1000;
      dt *= timeScale;

      world.step(dt);
      if (render != null) render.render();

      _previoustimestamp = timestamp;
      if (_running) _step();
    });
  }

}
