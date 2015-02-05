part of dots;

abstract class Body {

  /// The body's position [px].
  Vector s = const Vector(0, 0);
  /// The body's velocity [px/s].
  Vector v = const Vector(0, 0);
  /// The body's acceleration [px/s^2].
  Vector a = const Vector(0, 0);
  /// The coefficient of restitution.
  final num k = 1;
  /// Should return the radius of the bounding circle.
  final num radius;

  Body(this.radius);

  void step(num dt);

}

class FixedBody extends Body {

  /// The body's velocity [px/s].
  final Vector v = const Vector(0, 0);
  /// The body's acceleration [px/s^2].
  final Vector a = const Vector(0, 0);

  FixedBody(r) : super(r);

  void step(num dt) {}

}

class DynamicBody extends Body {

  DynamicBody(r) : super(r);

  /// Applies the velocity and acceleration
  /// on the body's position for a given time difference.
  void step(num dt) {
    s = (a / 2 * dt * dt) + (v * dt) + s;
    v = (a * dt) + v;
  }

}
