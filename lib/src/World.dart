part of dots;

class World {

  List<Dot> objects;

  World() => setup();

  //abstract void setup();
  void setup();

  void step(num dt) {
    objects.forEach((body) {
      body.step(dt);
      // Process collisions.
      objects.where((b) => body != b && Collision.isCollision(body, b))
          .map((b) => new Collision(body, b))
          .forEach((c) => c.execute());
    });
  }

}
