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
    collisionCtrl.clean();

    bodies.forEach((body) {
      body.step(dt);
      remaining.remove(body);
      // Process collisions.
      // But only for dynamic bodies.
      //if (body is DynamicBody) {
        remaining.forEach((b) => collisionCtrl.process(body, b));
      //}
    });
  }

}
