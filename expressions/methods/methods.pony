class C
  fun add(x: U32, y: U32): U32 =>
    x + y

  fun nop() =>
    add(1, 2)  // Pointless, we ignore the result

actor Main
  new create(env: Env) =>
    env.out.print("2 + 3 = " + C.add(2, 3).string())