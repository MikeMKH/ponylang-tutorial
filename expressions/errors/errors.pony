actor Main
  fun factorial(x: I32): I32 ? =>
    if x < 0 then error end
    if x == 0 then
      1
    else
      x * factorial(x - 1)?
    end
  
  new create(env: Env) =>
    // let x: I32 = -1
    let x: I32 = 4
    env.out.print("factorial of " + x.string())
    try
      env.out.print(" = " + factorial(x)?.string())
    else
      env.out.print(x.string() + " is unsupported")
    end
    