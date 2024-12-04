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