actor Main
  new create(env: Env) =>
    var x1: String = "Hello"
    var y1 = "Hello"
    var z1: String
    z1 = "Hello"
    
    var x2: U32 = 3
    let y2: U32 = 4
    x2 = 5  // OK
    // y2 = 6  // Error, y is let
    
    if x2 > y2 then
      var z2 = "x2 is bigger"
      env.out.print(z2)  // OK
    end
    // env.out.print(x2)  // Illegal
    
    let x3: U32 = 3 // Ok
    // let y3: U32 // Error, can't declare a let local without assigning to it
    // y3 = 6 // Error, can't reassign to a let local

class Wombat
  let name: String
  var _hunger_level: U32

  new create(hunger: U32) =>
    name = "Fantastibat"
    _hunger_level = hunger
  
  new default() =>
    name = "Billy"
    // set_hunger_level(6) // Error: field _hunger_level left undefined in constructor
    _hunger_level = 6
    
  fun ref set_hunger_level(hunger_level: U32) =>
    _hunger_level = hunger_level
  
  // fun ref set_name(name' : String) =>
  //   name = name' // Error, can't assign to a let definition more than once