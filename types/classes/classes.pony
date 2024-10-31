class Greet
  let message: String
  var _name: String
  
  new create(message': String, name': String) =>
    message = message'
    _name = name'
  
  new hey(message': String) =>
    message = message'
    _name = "no one"
  
  fun greet(): String =>
    message + ", " + _name
  
  fun ref set_name(to: String = "unknown"): String =>
    _name = to

actor Main
  new create(env: Env) =>
    // default constructor 
    let hello = Greet("hello", "mike")
    env.out.print(hello.greet())
    // named constructor
    let hey = Greet.hey("hey")
    env.out.print(hey.greet())
    // function call
    hello.set_name("lily")
    env.out.print(hello.greet())
    // default function call (must have () after function name)
    hey.set_name()
    env.out.print(hey.greet())