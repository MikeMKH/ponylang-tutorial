class Foo
  let _a: String

  new create(a: String) =>
    _a = a

  fun eq(that: box->Foo): Bool =>
    this._a == that._a

class Bar
  let _a: String
  
  new create(a: String) =>
    _a = a

actor Main
  new create(env: Env) =>
    // identity equality
    if None is None then
      env.out.print("None is None") // true, there is only 1 instance of None
    end
    
    let a = Foo("hi")
    let b = Foo("hi")
    
    if a is b then
      env.out.print("a is b")
    else
      env.out.print("a is not b") // a is not the same instance as b
    end
    
    let c = a
    if a is c then
      env.out.print("a is c") // a is the same instance as c
    else
      env.out.print("a is not c")
    end
    
    // structural equality
    let x = Foo("hi")
    let y = Foo("bye")
    let z = Foo("hi")
    
    if x == y then
      env.out.print("x == y")
    else
      env.out.print("x != y") // "hi" != "bye"
    end
    
    if x == z then
      env.out.print("x == z") // "hi" == "hi"
    else
      env.out.print("x != z")
    end