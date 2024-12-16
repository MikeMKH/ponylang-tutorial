actor Main
  fun test(a: String): String =>
    var b: String = consume a
    // var c: String = a // can't use a consumed local or field in an expression
    b
    
  new create(env: Env) =>
    let r1: String = test("hi")
    env.out.print(r1)
    