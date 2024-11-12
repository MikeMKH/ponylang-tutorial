use "format"

actor Main
  new create(env: Env) =>
    // literal examples
    let my_explicit_unsigned: U32 = 42_000
    let my_constructor_unsigned = U8(1)
    let my_constructor_float = F64(1.234)
    let my_decimal_int: I32 = 1024
    let my_hexadecimal_int: I32 = 0x400
    let my_binary_int: I32 = 0b10000000000
    let my_double_precision_float: F64 = 0.009999999776482582092285156250
    let my_scientific_float: F32 = 42.12e-4
    let big_a: U8 = 'A'                 // 65
    let hex_escaped_big_a: U8 = '\x41'  // 65
    let newline: U32 = '\n'             // 10
    let multiByte: U64 = 'ABCD' // 0x41424344
    
    // string examples
    let pony = "🐎"
    let pony_hex_escaped = "p\xF6n\xFF"
    let pony_unicode_escape = "\U01F40E"

    env.out.print(pony + " " + pony_hex_escaped + " " + pony_unicode_escape)
    for b in pony.values() do
      env.out.print(Format.int[U8](b, FormatHex))
    end
    
    let stacked_ponies = "
    🐎
    🐎
    🐎
    "
    
    let another_pony = "🐎"
    if pony is another_pony then
      env.out.print("found some " + pony)
    end
    