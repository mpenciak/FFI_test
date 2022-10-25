def main : IO Unit := do
  IO.println (← IO.getEnv "HOME")

#eval main