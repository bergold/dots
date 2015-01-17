part of dot;

class DotWorld extends World {

  final num width;
  final num height;

  DotWorld(this.width, this.height);

  //@override
  void setup() {

    var test = new Dot('red', 10);
    test.p = new Vector(width / 2, 0);
    test.a = new Vector(0, 5);
    bodies.add(test);

  }

}

class Dot extends Body {

  /// The dot's type.
  final String type;

  Dot(this.type, r) : super(r);

  Dot.fixed(this.type, r) : super.fixed(r);

}

class DotRender extends Render {

  final HtmlElement container;

  DotRender(this.container, w) : super(w);

  void render() {
    window.console.groupCollapsed("trigger render");
    world.bodies.forEach((body) {
      window.console.log("${body.p}, ${body.v}, ${body.a}");
    });
    window.console.groupEnd();
  }

}
