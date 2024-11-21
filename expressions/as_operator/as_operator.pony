interface Critter
  fun wash(): String

class Wombat is Critter
  fun wash(): String => "I'm a clean wombat!"

class Capybara is Critter
  fun wash(): String => "I feel squeaky clean!"
  fun swim(): String => "I'm swimming like a fish!"

actor Main
  new create(env: Env) =>
    let critters = Array[Critter].>push(Wombat).>push(Capybara)
    for critter in critters.values() do
      env.out.print(critter.wash())
      try
        env.out.print((critter as Capybara).swim())
      end
    end
    
    let anys1 = Array[Any ref].>push(Wombat).>push(Capybara)
    for any in anys1.values() do
      try
        env.out.print((any as Critter).wash())
      end
    end
    
    let anys2 = Array[Any ref].>push(Wombat).>push(Capybara)
    for any in anys2.values() do
      try
        match any
        | let critter: Critter =>
          env.out.print(critter.wash())
        else
          error
        end
      end
    end