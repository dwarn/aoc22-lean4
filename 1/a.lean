import Std

def f (l : List String) : Option Int :=
let ls := l.splitOnP (· = "")
let sums := ls.map (fun x => List.foldr (· + ·) 0 (x.map String.toInt!))
sums.maximum?

def main : IO Unit := do
  let inp ← IO.FS.lines "1/a.in"
  IO.print (f inp.toList)
  return ()

#eval main