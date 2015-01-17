part of dots;

abstract class World {

  List<Body> bodies = new List<Body>();

  void setup() {}

  void reset() {
    bodies.clear();
    setup();
  }

  void step(num dt) {
    bodies.forEach((body) {
      body.step(dt);
      // Process collisions.
      bodies.where((b) => body != b && Collision.collides(body, b))
          .map((b) => new Collision(body, b))
          .forEach((c) => c.execute());
    });
  }

}
