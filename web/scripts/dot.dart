part of dot;

class DotWorld extends World {

  final num width;
  final num height;

  DotWorld(this.width, this.height);

  @override
  void setup() {

  }

}

class Dot extends Body {

  /// The dot's type.
  final String type;

  Dot(this.type, r, [p, v, a]) : super(r, p, v, a);

  Dot.fixed(this.type, r, [p]) : super.fixed(r, p);

}

class DotRender extends Render {

  void render() {

  }

}
