import Std

def f (l : List Char) : Option Nat :=
match (l.splitOnP (fun c => c = ',' ∨ c = '-')).map (String.toNat! ∘ String.mk) with
| [a, b, c, d] => some <| if c <= b && a <= d then 1 else 0
| _ => none

def main' : IO (Option Nat) := do
  let inp ← IO.FS.lines "4/a.in"
  return Array.foldr ((· + ·) <$> · <*> ·) (some 0) (inp.map (f ∘ String.toList))

--#eval main'