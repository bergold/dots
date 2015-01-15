library dots.render;

import 'package:dots/dots.dart';

abstract class Render {

  final World world;

  Render(this.world);

  abstract void render();

}

abstract class ChangeRender extends Render {

  List bodyhash;

  void render() {

  }

  abstract void _add(Body body);
  abstract void _remove(Body body);
  abstract void _update(Body body);

}
