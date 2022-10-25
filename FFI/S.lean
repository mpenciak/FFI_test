def hi : Nat := 3

@[extern "lean_get_env_var"] opaque asdf : PUnit → Array String
@[extern "lean_add"] opaque foo : UInt32 → UInt32 → UInt32