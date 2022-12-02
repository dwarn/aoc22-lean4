import Std

open Std

def List.sum [Add α] [OfNat α 0] (l : List α) : α := l.foldr (· + ·) 0

def update [Add α] [OfNat α 0] (m : RBMap β α cmp) (k : β) (v : α) : RBMap β α cmp :=
  match m.find? k with
  | none => m.insert k v
  | some v' => m.insert k (v+v')

def List.sort [Ord α] (l : List α) : List α :=
let x : RBMap α Nat compare := l.foldr (fun x m => update m x 1) RBMap.empty
(x.keysList.zipWith (fun a n => List.replicate n a) x.valuesList).join

def f (l : List String) : Int :=
  let ls := l.splitOnP (· = "")
  let sums := ls.map fun x => (x.map String.toInt!).sum
  let y := sums.sort.reverse.take 3
  y.sum

def main : IO Unit := do
  let inp ← IO.FS.lines "1/a.in"
  IO.print (f inp.toList)
  return ()

--#eval main