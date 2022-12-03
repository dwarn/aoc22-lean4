import Std

def prio (c : Char) : UInt32 :=
if 'a' <= c ∧ c <= 'z'
then c.val - 'a'.val + 1
else c.val - 'A'.val + 27

def f : String → Option UInt32
  | ⟨l⟩ => 
  let (a, b) := l.splitAt (l.length / 2)
  prio <$> (a.inter b).head?

def main' : IO (Option UInt32) := do
  let inp ← IO.FS.lines "3/a.in"
  return Array.foldr ((· + ·) <$> · <*> ·) (some 0) (inp.map f)

--#eval main'