class Foo
  var _f: F64 = 0

  fun ref addmul(add: F64, mul: F64): F64 =>
    _f = (_f + add) * mul
    _f // result of = is the old value

actor Main
  new create(env: Env) =>
    let foo: Foo = Foo
    let add3 = foo~addmul(3)
    env.out.print("3 * 4 = " + add3(4).string())
    
    let f1 = foo~addmul(1, 2)
    env.out.print("((3 * 4) + 1) * 2 = " + f1().string())
    
    let f2 = foo~addmul()
    env.out.print("(((3 * 4) + 1 * 2) + 5) * 6 = " + f2(5, 6).string())
    