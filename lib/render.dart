library dots.render;

import 'package:dots/dots.dart';

abstract class Render {

  final World world;

  Render(this.world);

  void render();

}

abstract class ChangeRender extends Render {

  List bodyhash;

  void render() {

  }

  void _add(Body body);
  void _remove(Body body);
  void _update(Body body);

}
