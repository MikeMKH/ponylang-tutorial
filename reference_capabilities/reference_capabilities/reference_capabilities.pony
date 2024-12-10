actor Main
  new create(env: Env) =>
    // let binding cannot change but var can
    var x1: String iso = "iso".string() // An isolated string
    var x2: String trn = "trn".string() // A transition string
    var x3: StringBytes ref = "ref".values() // A string bytes reference
    var x4: String val = "val" // A string value
    var x5: String box = "box" // A string box
    var x6: String tag = "tag" // A string tag
    
    x1 = "something else".string()
    x1 = "again".string()
    
    x2 = "something else".string()
    x2 = "again".string()
    
    x3 = "something else".values()
    x3 = "again".values()
    
    x4 = "also"
    x5 = "also"
    x6 = "also"
    
    env.out.print("Reference Capabilities")