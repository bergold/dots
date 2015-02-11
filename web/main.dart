// Copyright (c) 2015, Emil Bergold. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.
library dots.web;

import 'dart:html';
import 'dart:async';
import 'dart:math';

import 'package:dots/dots.dart';
import 'package:dots/driver.dart';
import 'package:dots/render.dart';

part 'scripts/dot.dart';

void main() {

  var elmWorld = querySelector('#world');
  var w = elmWorld.clientWidth;
  var h = elmWorld.clientHeight;
  elmWorld.width = w;
  elmWorld.height = h;

  var world = new DotWorld(w, h);

  var render = new CanvasDotRender(elmWorld, world);

  var driver = new Driver(world, render);

  querySelector('#btn1').onClick.listen((e) => driver.start());
  querySelector('#btn2').onClick.listen((e) => driver.stop());
  querySelector('#btn3').onClick.listen((e) => world.drop());
  querySelector('#btn4').onClick.listen((e) => world.drop(20));
  querySelector('#btn5').onClick.listen((e) => world.reset());
  querySelector('#btn6').onClick.listen((e) {
    driver.start();
    new Timer(new Duration(seconds: 1), () => driver.stop());
  });

}
