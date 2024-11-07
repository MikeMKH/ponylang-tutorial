primitive UnionRed
primitive UnionBlue
primitive UnionGreen

type UnionColour is (UnionRed | UnionBlue | UnionGreen)

primitive ConstRed    fun apply(): U32 => 0xFF0000FF
primitive ConstGreen  fun apply(): U32 => 0x00FF00FF
primitive ConstBlue   fun apply(): U32 => 0x0000FFFF

type ConstColour is (ConstRed | ConstBlue | ConstGreen)

primitive NamespaceColours
  fun red(): U32 => 0xFF0000FF
  fun green(): U32 => 0x00FF00FF
  fun blue(): U32 => 0x0000FFFF

interface IHasName
  fun name(): String

interface IHasAge
  fun age(): U32

interface IHasFeelings
  fun feeling(): String

type IPerson is (IHasName & IHasAge & IHasFeelings)

trait HasName
  fun name(): String => "Bob"

trait HasAge
  fun age(): U32 => 42

trait HasFeelings
  fun feeling(): String => "Great!"

type Person is (HasName & HasAge & HasFeelings)

actor Main
  new create(env: Env) =>
    env.out.print("hello type aliases")

