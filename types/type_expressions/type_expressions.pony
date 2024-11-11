actor Main
  new create(env: Env) =>
    // tuple
    var x : (String, U32)
    x = ("mike", 43)
    x = ("lily", 5)
    (var y, var z) = x
    x = ("kelsey", x._2)
    // union
    var a: (String | None)
    a = "hello"
    a = None