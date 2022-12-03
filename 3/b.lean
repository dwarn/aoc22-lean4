import Std

def prio (c : Char) : UInt32 :=
if 'a' <= c ∧ c <= 'z'
then c.val - 'a'.val + 1
else c.val - 'A'.val + 27

def f : List String → Option UInt32
  | [⟨a⟩, ⟨b⟩, ⟨c⟩] => prio <$> ((a.inter b).inter c).head?
  | _ => none

def main' : IO (Option UInt32) := do
  let inp ← Array.toList <$> IO.FS.lines "3/a.in"
  return List.foldr ((· + ·) <$> · <*> ·) (some 0) ((inp.toChunks 3).map f)

--#eval main'