part of dots;

abstract class World {

  List<Body> bodies;

  void setup() {}

  void reset() {
    bodies.clear();
    setup();
  }

  void step(num dt) {
    bodies.forEach((body) {
      body.step(dt);
      // Process collisions.
      bod.where((b) => body != b && Collision.collides(body, b))
          .map((b) => new Collision(body, b))
          .forEach((c) => c.execute());
    });
  }

}
