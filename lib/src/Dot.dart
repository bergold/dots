part of dots;

class Dot extends Body {

  /// True if the dot can move, otherwise false.
  final bool isFix;
  /// The dot's position.
  Vector p;
  /// The dot's velocity.
  Vector v;
  /// The dot's acceleration.
  Vector a;
  /// The dot's radius.
  num radius = 10;
  /// The dot's color.
  String color;

  Dot([this.p = const Vector(0, 0),
      this.v = const Vector(0, 0),
      this.a = const Vector(0, 0)]) : isFix = false;

  Dot.fix([this.p = const Vector(0, 0)]) :
      isFix = true,
      v = const Vector(0, 0),
      a = const Vector(0, 0);

  /// Applies the velocity and acceleration
  /// on the dot's position for a given time difference.
  void step(num dt) {
    v = v + a * dt;
    p = p + v * dt;
  }

}
