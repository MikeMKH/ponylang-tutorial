use "collections"

actor Main
  new create(env: Env) =>
    let x1 = object
      fun apply(): String => "hi 1"
    end
    env.out.print(x1())
    
    let x2 = object is Hashable
      fun apply(): String => "hi 2"
      fun hash(): USize => this().hash()
    end
    env.out.print(x2())