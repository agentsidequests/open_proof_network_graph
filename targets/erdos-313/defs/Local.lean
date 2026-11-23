/-
Copyright 2025 The Formal Conjectures Authors.

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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/313.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 313

*References:*
- [erdosproblems.com/313](https://www.erdosproblems.com/313)
- [A54377](https://oeis.org/A54377) (Primary pseudoperfect numbers)
-/

section

namespace Erdos313

/--
This set contains all solutions `(m, P)` to the Erdős problem 313.
A solution is a pair where `m` is an integer `≥ 2` and `P` is a non-empty, finite set of
distinct prime numbers, such that the sum of the reciprocals of the primes in `P` equals `1 - 1/m`.
-/
def erdos313Solutions : Set (ℕ × Finset ℕ) :=
  {(m, P) | 2 ≤ m ∧ P.Nonempty ∧ (∀ p ∈ P, p.Prime) ∧ ∑ p ∈ P, (1 : ℚ) / p = 1 - 1 / m}

/--
An integer `n` is a **primary pseudoperfect number** if it is the denominator `m` in a
solution `(m, P)` to the Erdős 313 problem.
-/
def IsPrimaryPseudoperfect (n : ℕ) : Prop := ∃ P, (n, P) ∈ erdos313Solutions

end Erdos313
