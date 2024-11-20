class Foo
  var _x: U32

  new create(x: U32) =>
    _x = x

  fun eq(that: Foo): Bool =>
    _x == that._x

class Bar is Equatable[Bar]

actor Main
  fun f1(x: U32): String =>
    match x
    | 1 => "one"
    | 2 => "two"
    | 3 => "three"
    | 5 => "not four"
    else
      "something else"
    end

  fun f2(x: Foo): String =>
    match x
    | Foo(1) => "one"
    | Foo(2) => "two"
    | Foo(3) => "three"
    | Foo(5) => "not four"
    else
      "something else"
    end

  fun f3(x: (U32 | String | None)): String =>
    match x
    | None => "none"
    | 2 => "two"
    | 3 => "three"
    | "5" => "not four"
    else
      "something else"
    end
    
  fun f4(x: (Bar | None)): String =>
    match x
    | Bar => "bar"
    | None => "nope"
    else
      ""
    end
    
  fun f5(x: (U32 | String | None)): String =>
    match x
    | None => "none"
    | 2 => "two"
    | 3 => "three"
    | let u: U32 => "other integer"
    | let s: String => s
    end

  new create(env: Env) =>
    let x1: U32 = 5
    env.out.print("x is " + f1(x1))
    
    let x2 = Foo(4)
    env.out.print("x is " + f2(x2))
    
    let x3 = "5"
    env.out.print("x is " + f3(x3))
    
    env.out.print("x is " + f4(Bar))
    
    let x5 = "lily"
    env.out.print("x is " + f5(x5))
    
    