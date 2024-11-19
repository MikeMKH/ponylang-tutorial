actor Main
  new create(env: Env) =>
    var a: U32 = 7
    var b: U32 = 8
    
    if a == b then
      env.out.print("they are the same")
    elseif a > b then
      env.out.print("a is bigger")
    else
      env.out.print("b bigger")
    end