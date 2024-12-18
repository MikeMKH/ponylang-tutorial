use "collections"

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
  
  fun get(): U32 =>
    _x
  
  fun get_string(): String =>
    _x.string()
    
  fun hello(name: String): String =>
    "hello " + name

  fun f(): String =>
    let a = hello("Fred")
    a

  fun j(a: U32 = 1, b: U32 = 2, c: U32 = 3, d: U32 = 4, e: U32 = 5): U32  =>
    0

  fun k() =>
    j(6, 7 where d = 8)
    // Equivalent to:
    j(6, 7, 3, 8, 5)

class Bar
  fun f() =>
    var a: Foo = Foo.from_int(3)
    var b: U32 = a.get()
    var c: U32 = g(b)

  fun g(x: U32): U32 =>
    x + 1
  
  fun h() =>
    var a: Coord = Coord.create()     // Contains (0, 0)
    var b: Coord = Coord.create(3)    // Contains (3, 0)
    var c: Coord = Coord.create(3, 4) // Contains (3, 4)

  fun j() =>
    var a: Coord = Coord.create(3, 4) // Contains (3, 4)
    var b: Coord = Coord.create(where y = 4, x = 3) // Contains (3, 4)

class Coord
  var _x: U32
  var _y: U32

  new create(x: U32 = 0, y: U32 = 0) =>
    _x = x
    _y = y

primitive Printer
  fun print_two_strings(out: StdStream, s1: String, s2: String) =>
    out.>print(s1).>print(s2)
    // Equivalent to:
    // out.print(s1)
    // out.print(s2)
    // out

actor Main
  new create(env: Env) =>
    env.out.print("2 + 3 = " + C.add(2, 3).string())
    let foo = Foo.from_int(C.add(11, 12))
    env.out.print("11 + 12 = " + foo.get_string())
    env.out.print(foo.hello("Lily"))
    env.out.print(foo.f())
    env.out.print("8 + 1 = " + Bar.g(8).string())
    try
      let std: StdStream = env.out as StdStream
      Printer.print_two_strings(std where s2 = "world", s1 = "hello")
    end
    let list_of_numbers = List[U32].from([1; 2; 3; 4])
    let is_odd = {(n: U32): Bool => (n % 2) == 1}
    for odd_number in list_of_numbers.filter(is_odd).values() do
      env.out.print(odd_number.string())
    end