// Copyright (c) 2015, Emil Bergold. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.
library dot;

import 'dart:html';

import 'package:dots/dots.dart';
import 'package:dots/driver.dart';
import 'package:dots/render.dart';

part 'scripts/dot.dart';

void main() {

  var elmWorld = querySelector('#world');

  var world = new DotWorld(500, 300);
  world.setup();
  /*var render = new DotRender(elmWorld);

  var driver = new Driver(world);
  driver.render = render;*/

}
