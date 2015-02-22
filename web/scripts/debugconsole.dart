part of dots.web;

void initDebugConsole(DotWorld world, Driver driver) {

  var container = querySelector('#debugconsole');
  container.attributes.remove('hidden');
  container.parent.attributes.remove('hidden');

  // driver
  container.querySelector('#driver_start').onClick.listen((e) => driver.start());
  container.querySelector('#driver_stop').onClick.listen((e) => driver.stop());
  container.querySelector('#driver_reset').onClick.listen((e) => driver.reset());
  container.querySelector('#driver_1sec').onClick.listen((e) {
    driver.start();
    new Timer(new Duration(seconds: 1), () => driver.stop());
  });

  // world
  container.querySelector('#world_drop_n').onClick.listen((e) {
    var inpN = container.querySelector('#world_drop_n_count') as InputElement;
    var n = inpN.valueAsNumber;
    world.drop(n);
  });
  container.querySelector('#world_drop_custom').onClick.listen((e) {

  });
  container.querySelector('#world_reset').onClick.listen((e) => world.reset());

}
