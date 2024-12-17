actor Main
  new create(env: Env) =>
    let line: String = "https:\\\\www.google.com"
    let i: ISize =
      try
        line.find(":", 0, 0)?
      else
        0
      end
    let protocol = recover val line.substring(0, i).>strip() end
    env.out.print(line)
    env.out.print("protocol " +  protocol + " found at " + i.string())