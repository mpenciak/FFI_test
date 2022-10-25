import FFI.S

def main : IO Unit := do
  IO.println (← IO.getEnv "HOME")
  IO.println $ foo 3 2
