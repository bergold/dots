part of dots;

class World {

  List<Dot> objects;

  void spawn(Dot d) {
    objects.push(d);
  }

  void step(num dt) {
    objects.forEach((dot) => dot.step(dt));
  }

}
