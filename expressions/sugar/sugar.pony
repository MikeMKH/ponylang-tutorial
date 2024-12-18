class Foo
  var _value: String

  new create(value': String = "") =>
    _value = value'
  
  new apply(value': String) =>
    _value = value'

actor Main
  new create(env: Env) =>
    let foo = Foo.create()
    foo("hi")
    foo.apply("hello")
    
    let lily = Foo("lily")
    let jack = Foo.create("jack")
    
    let x = Foo("x")
    let y = Foo.create().apply("y")