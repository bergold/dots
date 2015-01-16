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

  /// The dot's radius.
  final num _radius = 10;
  num get radius => _radius;
  /// The dot's type.
  final String type;

  Dot(this.type, this._radius, [p, v, a]) : super(p, v, a);

  Dot.fixed(this.type, this._radius, [p]) : super.fixed(p);

}

class DotRender extends Render {

  void render() {

  }

}
