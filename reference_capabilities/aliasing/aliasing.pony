actor Main
  // fun test1(a: String iso) =>
  //   var b: String iso = a // Not allowed!
  
  fun test2(a: String iso) =>
    var b: String tag = a // Allowed!
    
  fun test3(a: String trn) =>
    var b: String box = a // Allowed!
  
  // from https://github.com/snsinfu/bit4/blob/0633d7357d157b5f47c70091dc676dc2e06c1ae1/test074-pony_capability/main.pony#L54-L56
  fun makeTrn(a: String iso): String trn^ =>
    let b: String trn = consume a // consume(iso!) => iso^ => iso => trn
    b
  
  fun test4(a: String iso) =>
    var b: String iso! = a
    
  new create(env: Env) =>
    test2("iso=>tag".clone())
    test3(makeTrn("trn=>box".clone()))
    test4("iso=>tag".clone())
    env.out.print("aliasing")
    