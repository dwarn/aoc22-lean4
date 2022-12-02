def shape_score : Char → Int
| 'X' | 'A' => 1
| 'Y' | 'B' => 2
| 'Z' | 'C' => 3
| _ => 37

def f (l : String) : Int :=
  let opp := l.get ⟨0⟩
  let me := l.get ⟨2⟩
  shape_score me + (shape_score me + 4 - shape_score opp) % 3 * 3

def main' : IO Int := do
  let inp ← IO.FS.lines "2/a.in"
  return Array.foldr (· + ·) 0 (inp.map f)
-- #eval main'