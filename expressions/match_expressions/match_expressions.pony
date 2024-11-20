class Foo
  var _x: U32

  new create(x: U32) =>
    _x = x

  fun eq(that: Foo): Bool =>
    _x == that._x

actor Main
  fun f(x: U32): String =>
    match x
    | 1 => "one"
    | 2 => "two"
    | 3 => "three"
    | 5 => "not four"
    else
      "something else"
    end

  fun g(x: Foo): String =>
    match x
    | Foo(1) => "one"
    | Foo(2) => "two"
    | Foo(3) => "three"
    | Foo(5) => "not four"
    else
      "something else"
    end

  new create(env: Env) =>
    let x1: U32 = 5
    env.out.print("x is " + f(x1))
    
    let x2 = Foo(4)
    env.out.print("x is " + g(x2))
    
    