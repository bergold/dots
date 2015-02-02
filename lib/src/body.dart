part of dots;

abstract class Body {

  /// True if the body can move, otherwise false.
  final bool isFixed;
  /// The body's position [px].
  Vector p;
  /// The body's velocity [px/s].
  Vector v;
  /// The body's acceleration [px/s^2].
  Vector a;
  /// Should return the radius of the bounding circle.
  final num radius;

  Body(this.radius, {
      this.p: const Vector(0, 0),
      this.v: const Vector(0, 0),
      this.a: const Vector(0, 0)
    }) : isFixed = false;

  Body.fixed(this.radius, {
      this.p: const Vector(0, 0)
    }) :
      isFixed = true,
      v = const Vector(0, 0),
      a = const Vector(0, 0);

  /// Applies the velocity and acceleration
  /// on the body's position for a given time difference.
  void step(num dt) {
    if (isFixed) return;
    p = (a / 2 * dt * dt) + (v * dt) + p;
    v = (a * dt) + v;
  }

}
