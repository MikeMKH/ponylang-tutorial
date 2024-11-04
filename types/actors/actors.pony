actor Aardvark
  let name: String
  var _hunger_level: U64 = 0

  new create(name': String) =>
    name = name'

  be eat(amount: U64) =>
    _hunger_level = _hunger_level - amount.min(_hunger_level)
  
  be state(env: Env) =>
    env.out.print(name + " is " + _hunger_level.string() + " hungry")

actor Main
// This is printed first
// This is printed last
// Mike is 0 hungry
  new create(env: Env) =>
    call_me_later(env)
    env.out.print("This is printed first")
    
    let mike = Aardvark("Mike")
    mike.eat(10)
    mike.state(env)

  be call_me_later(env: Env) =>
    env.out.print("This is printed last")
    