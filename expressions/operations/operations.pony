// Define a suitable type
class Pair
  var _x: U32 = 0
  var _y: U32 = 0

  new create(x: U32, y: U32) =>
    _x = x
    _y = y

  // Define a + function
  fun add(other: Pair): Pair =>
    Pair(_x + other._x, _y + other._y)
  
  // Define a * function
  fun mul(other: Pair): Pair =>
    Pair(_x * other._x, _y * other._y)

// Now let's use it
class Foo
  fun foo() =>
    var x = Pair(1, 2)
    var y = Pair(3, 4)
    var z = x + y
  
  fun bar() =>
    var x = Pair(5, 6)
    var y = Pair(7, 8)
    var z = x * y

actor Main
  new create(env: Env) =>
    Foo.foo()
    Foo.bar()