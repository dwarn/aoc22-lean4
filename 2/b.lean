def shape_score : Char → Int
| 'X' | 'A' => 1
| 'Y' | 'B' => 2
| 'Z' | 'C' => 3
| _ => 37

def f (l : String) : Int :=
  let opp := shape_score (l.get ⟨0⟩)
  let me := shape_score (l.get ⟨2⟩)
  3 * (me - 1) + 1 + (opp + me) % 3

def main' : IO Int := do
  let inp ← IO.FS.lines "2/a.in"
  return Array.foldr (· + ·) 0 (inp.map f)
-- #eval main'