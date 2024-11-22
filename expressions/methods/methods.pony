class C
  fun add(x: U32, y: U32): U32 =>
    x + y

  fun nop() =>
    add(1, 2)  // Pointless, we ignore the result

class Foo
  var _x: U32

  new create() =>
    _x = 0

  new from_int(x: U32) =>
    _x = x
  
  fun get_string_x(): String =>
    _x.string()

actor Main
  new create(env: Env) =>
    env.out.print("2 + 3 = " + C.add(2, 3).string())
    let foo = Foo.from_int(C.add(11, 12))
    env.out.print("11 + 12 = " + foo.get_string_x())