class Foo
  var _x: U32

  new create(x: U32) =>
    _x = x

  fun eq(that: Foo): Bool =>
    _x == that._x

class Bar is Equatable[Bar]

class A
  fun ref sendable() =>
    None

class B
  fun ref update() =>
    None

actor Main
  var _x6: (A iso | B ref | None)
  
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
  
  fun f7(x: (String | None), y: U32): String =>
    match (x, y)
    | (None, let u: U32) => "none"
    | (let s: String, 2) => s + " two"
    | (let s: String, 3) => s + " three"
    | (let s: String, let u: U32) => s + " other integer"
    else
      "something else"
    end

  fun f8(x: (String | None), y: U32): String =>
    match (x, y)
    | (None, _) => "none"
    | (let s: String, 2) => s + " two"
    | (let s: String, 3) => s + " three"
    | (let s: String, let u: U32) if u > 14 => s + " other big integer"
    | (let s: String, _) => s + " other small integer"
    else
      "something else"
    end

  new create(env: Env) =>
    _x6 = None
    
    let x1: U32 = 5
    env.out.print("x is " + f1(x1))
    
    let x2 = Foo(4)
    env.out.print("x is " + f2(x2))
    
    let x3 = "5"
    env.out.print("x is " + f3(x3))
    
    env.out.print("x is " + f4(None))
    
    let x5 = "lily"
    env.out.print("x is " + f5(x5))
    
    let x7 = "lily"
    let y7: U32 = 8
    env.out.print("x and y are " + f7(x7, y7))
    
    let x8 = "blight"
    let y8: U32 = 15
    env.out.print("x and y are " + f8(x8, y8))

  be f(a': A iso) =>
    match (_x6 = None) // type of this expression: (A iso^ | B ref | None)
    | let a: A iso => f(consume a)
    | let b: B ref => b.update()
    end
    
    