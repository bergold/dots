part of dots;

abstract class Body {

  /// True if the body can move, otherwise false.
  final bool isFixed;
  /// The body's position.
  Vector p;
  /// The body's velocity.
  Vector v;
  /// The body's acceleration.
  Vector a;

  Body([this.p = const Vector(0, 0),
      this.v = const Vector(0, 0),
      this.a = const Vector(0, 0)]) : isFixed = false;

  Body.fixed([this.p = const Vector(0, 0)]) :
      isFixed = true,
      v = const Vector(0, 0),
      a = const Vector(0, 0);

  /// Applies the velocity and acceleration
  /// on the body's position for a given time difference.
  void step(num dt) {
    if (isFixed) return;
    v = v + a * dt;
    p = p + v * dt;
  }

  /// Should return the radius of the bounding circle.
  abstract num get radius;

}
