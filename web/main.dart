// Copyright (c) 2015, Emil Bergold. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'dart:html';

import 'package:dots/dots_driver.dart';

void main() {
  var elmWorld = querySelector('#world');
  var world = new DotsDriver(elmWorld);

}
