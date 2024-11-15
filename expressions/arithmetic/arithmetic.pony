actor Main
  new create(env: Env) =>
    // unsigned wrap-around on overflow
    if (U32.max_value() + 1) == 0 then
      env.out.print("(U32.max_value() + 1) == 0")
    else
      env.out.print("(U32.max_value() + 1) != 0")
    end
    if (U32.max_value() +~ 1) == 0 then
      env.out.print("(U32.max_value() +~ 1) == 0")
    else
      env.out.print("(U32.max_value() +~ 1) != 0")
    end

   // signed wrap-around on overflow/underflow
   if (I32.min_value() - 1) == I32.max_value() then
     env.out.print("(I32.min_value() - 1) == I32.max_value()")
   else
     env.out.print("(I32.min_value() - 1) != I32.max_value()")
   end
   if (I32.min_value() -~ 1) == I32.max_value() then
     env.out.print("(I32.min_value() -~ 1) == I32.max_value()")
   else
     env.out.print("(I32.min_value() -~ 1) != I32.max_value()")
   end
   
   // partial arithmetic
   let result1 =
     try
       USize.max_value() +? env.args.size()
     else
       env.out.print("overflow detected: USize.max_value() +? env.args.size()")
     end

  // checked arithmetic
  let result2 =
    match USize.max_value().addc(env.args.size())
    | (let result2: USize, false) =>
      env.out.print("no overflow detected: USize.max_value().addc(env.args.size())")
    | (_, true) =>
      env.out.print("overflow detected: USize.max_value().addc(env.args.size())")
  end