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
    
    var lots = true
    var x1: U32 = 1 + if lots then 100 else 2 end // 101
    
    var friendly = false
    var x2: (String | Bool) = // false
      if friendly then
        "Hello"
      else
        false
      end
    var x3: (String | None) = // None
      if friendly then
        "Hello"
      end
    
    var x4: (String | None) = // "Sarah"
      for name in ["Bob"; "Fred"; "Sarah"].values() do
        name
      end
    match x4
    | let s: String => env.out.print("x is " + s)
    | None => env.out.print("x is None")
    end
    
    var x5: (String | None) = // None
      for name in Array[String].values() do
        name
      end
    match x5
    | let s: String => env.out.print("x is " + s)
    | None => env.out.print("x is None")
    end
    
    var x6: String = // "no names!"
      for name in Array[String].values() do
        name
      else
        "no names!"
      end
    env.out.print("x is " + x6)