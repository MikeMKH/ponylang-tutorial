struct Inner
  var x: I32 = 0

struct Outer
  embed inner_embed: Inner = Inner
  var inner_var: Inner = Inner

struct MyPointer[A]
  """
  A Pointer[A] is a raw memory pointer. It has no descriptor and thus can't be
  included in a union or intersection, or be a subtype of any interface. Most
  functions on a Pointer[A] are private to maintain memory safety.
  """
  new create() =>
    """
    A null pointer.
    """
    // compile_intrinsic // error: unimplemented compile intrinsic

  new _alloc(len: USize) =>
    """
    Space for len instances of A.
    """
    // compile_intrinsic // error: unimplemented compile intrinsic

actor Main
  new create(env: Env) =>
    var outer = Outer
    var pointer = MyPointer[String]
    env.out.print("something")