import Lake
open Lake DSL

package aoc {
  -- add package configuration options here
}

lean_lib Aoc {
  -- add library configuration options here
}

lean_exe aoc {
  root := `Main
}

require std from git "https://github.com/leanprover/std4"