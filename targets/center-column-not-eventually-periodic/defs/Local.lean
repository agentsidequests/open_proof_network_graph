/-
Copyright 2026 The Formal Conjectures Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/

import Mathlib
import Defs.AlgebraWeylAlgebra
import Defs.AnalysisSpecialFunctionsAdditiveCharacter
import Defs.FieldTheoryMilnorKTheory
import Defs.GroupTheoryRationalClasses

/-! Ported mechanically from `FormalConjectures/Other/Rule30.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# The Rule 30 Prize Problems

**Rule 30** is the elementary cellular automaton with local update $c' = l \oplus (c \lor r)$,
the Boolean rule numbered $30$ by Wolfram. Started from a single black cell on a bi-infinite row,
its **center column** `t ↦ (state t) 0` looks random — it was long *Mathematica*'s default
pseudorandom generator — yet nothing about that randomness is proven. In 2019 Wolfram offered
the **Rule 30 Prizes** for three questions about it; we formalize the first two.

* **Problem 1.** Is the center column non-periodic (never eventually periodic)?
* **Problem 2.** Does each color occur on average equally often, i.e. does the running average
  of the values converge to $1/2$?

Problem 3 — whether computing the $n$-th cell requires at least $O(n)$ work — is omitted. It is
model-relative and has no canonical model-independent phrasing. All three are open.

*References:*
- [Announcing the Rule 30 Prizes](https://writings.stephenwolfram.com/2019/10/announcing-the-rule-30-prizes/),
  Stephen Wolfram, 2019.
- [Rule 30 Prizes](https://rule30prize.org/).
- [Wikipedia: Rule 30](https://en.wikipedia.org/wiki/Rule_30).
-/

section

namespace Rule30

/-- The Rule 30 local update on a bi-infinite row `row : ℤ → Bool`.
The new value at position $i$ is `row (i-1) ⊕ (row i ∨ row (i+1))`, i.e. Wolfram's rule $30$. -/
def step (row : ℤ → Bool) : ℤ → Bool :=
  fun i => xor (row (i - 1)) (row i || row (i + 1))

/-- The Rule 30 evolution from the single-black-cell initial condition: `state 0` is black
exactly at position $0$, and each subsequent row is obtained by applying `step`. -/
def state : ℕ → ℤ → Bool
  | 0     => fun i => decide (i = 0)
  | t + 1 => step (state t)

/-- The **center column** of Rule 30: the value of the single central cell (position $0$)
at time $t$. -/
def centerColumn (t : ℕ) : Bool := state t 0

end Rule30
