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
part 'scripts/debugconsole.dart';

Map<String, bool> flags = {
  'beta': false,
  'debug': false,
  'stats': false,
  'log': false,
  'log-verbose': false,
  'show-velocities': false,
  'show-accelerations': false
};

void main() {

  initFlags();

  var activeFlags = flags.keys.where((flag) => flags[flag]);
  if (activeFlags.isNotEmpty) print('active flags: ' + activeFlags.join(' '));

  var elmWorld = querySelector('#world');
  var w = elmWorld.clientWidth;
  var h = elmWorld.clientHeight;
  elmWorld.width = w;
  elmWorld.height = h;

  var world = new DotWorld(w, h);

  var render = new CanvasDotRender(elmWorld, world);

  var driver = new Driver(world, render);

  if (flags['log-verbose']) {
    driver.onStep.listen((dt) => print('[driver] step $dt'));
  }

  if (flags['debug']) {
    initDebugConsole(world, driver);
  }

  window.onResize.listen((evt) {
    world.width = elmWorld.width = elmWorld.clientWidth;
    world.height = elmWorld.height = elmWorld.clientHeight;
    driver.reset();
  });

}

void initFlags() {
  var str = Uri.decodeComponent(window.location.search).replaceFirst('?', '').toLowerCase();
  if (str.isNotEmpty) {
    str.split(',').forEach((flag) {
      flag = flag.trim();
      if (flag.isNotEmpty && flags.containsKey(flag)) flags[flag] = true;
    });
  }
  if (flags['log-verbose']) flags['log'] = true;
}
