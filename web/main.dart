// Copyright (c) 2015, Emil Bergold. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.
library dot;

import 'dart:html';
import 'dart:async';

import 'package:dots/dots.dart';
import 'package:dots/driver.dart';
import 'package:dots/render.dart';

part 'scripts/dot.dart';

void main() {

  var elmWorld = querySelector('#world');
  elmWorld.style.width = '500px';
  elmWorld.style.height = '300px';

  var world = new DotWorld(500, 300);

  var render = new DotRender(elmWorld, world);

  var driver = new Driver(world);
  driver.render = render;

  querySelector('#btn1').onClick.listen((e) => driver.start());
  querySelector('#btn2').onClick.listen((e) => driver.stop());
  querySelector('#btn3').onClick.listen((e) => world.reset());
  querySelector('#btn4').onClick.listen((e) {
    driver.start();
    new Timer(new Duration(seconds: 1), () => driver.stop());
  });

}
