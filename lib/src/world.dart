part of dots;

abstract class World {

  final collisionCtrl = new CollisionController();
  List<Body> bodies = new List<Body>();

  void setup() {}

  void reset() {
    bodies.clear();
    setup();
  }

  void step(num dt) {
    var remaining = new List.from(bodies);
    collisionCtrl.step();

    bodies.forEach((body) {
      body.step(dt);
      remaining.remove(body);
      // Process collisions.
      remaining.forEach((b) => collisionCtrl.process(body, b));
    });
  }

}
