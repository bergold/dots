part of dots;

class Dot extends Body {

  /// The dot's radius.
  final num _radius = 10;
  num get radius => _radius;
  /// The dot's color.
  String color;

  Body(this._radius, [p, v, a]) : super(p, v, a);

  Body.fixed(this._radius, [p]) : super.fixed(p);

}
