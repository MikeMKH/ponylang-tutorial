actor Main
  fun test(a: String): String =>
    var b: String = consume a
    // var c: String = a // can't use a consumed local or field in an expression
    b
  
  fun chain(a: String): String =>
    var once: String = "once"
    var r: String = once = consume a
    r
    
  new create(env: Env) =>
    let r1: String = test("hi")
    env.out.print(r1)
    
    let r2: String = chain("a")
    env.out.print(r2)
    