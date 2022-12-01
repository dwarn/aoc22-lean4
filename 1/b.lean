import Std

open Std

def List.sum (l : List Int) : Int := l.foldr (· + ·) 0

def update (m : RBMap α Int cmp) (k : α) (v : Int) : RBMap α Int cmp :=
  match m.find? k with
  | none => m.insert k v
  | some v' => m.insert k (v+v')

def f (l : List String) : Option Int :=
let ls := l.splitOnP (· = "")
let sums := ls.map fun x => (x.map String.toInt!).sum
let x : RBMap Int Int compare := List.foldr (fun x m => update m x 1) RBMap.empty sums
let y := List.take 3 (x.keysList.zipWith (fun k n => List.replicate n k) (x.valuesList.map Int.toNat)).join.reverse
y.sum

def main : IO Unit := do
  let inp ← IO.FS.lines "1/a.in"
  IO.print (f inp.toList)
  return ()

#eval main