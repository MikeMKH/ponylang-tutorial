actor Main
  new create(env: Env) =>
    let x: String ref = "compactable".string()
    let y = Compactor(4)
    y.try_compacting(x)
    env.out.print("Hello, " + x)

interface Compactable
  fun ref compact()
  fun size(): USize

class Compactor
  """
  Compacts data structures when their size crosses a threshold
  """
  let _threshold: USize

  new create(threshold: USize) =>
    _threshold = threshold

  fun ref try_compacting(thing: Compactable) =>
    if thing.size() > _threshold then
      thing.compact()
    end