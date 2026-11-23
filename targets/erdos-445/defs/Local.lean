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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/445.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 445

*References:*
- [erdosproblems.com/445](https://www.erdosproblems.com/445)
- [He00] Heath-Brown, D. R., Arithmetic applications of {K}loosterman sums. Nieuw Arch. Wiskd. (5)
  (2000), 380--384.
- [MathOverflow](https://mathoverflow.net/questions/69509/small-residue-classes-with-small-reciprocal)
-/

section

open Filter

namespace Erdos445

/--
The property that there exist $a,b\in(n,n+p^c)$ such that $ab\equiv 1\pmod{p}$.
-/
def Erdos445Prop (c : ℝ) (p n : ℕ) : Prop :=
  ∃ a b : ℕ,
    n < a ∧ (a : ℝ) < (n : ℝ) + (p : ℝ) ^ c ∧
    n < b ∧ (b : ℝ) < (n : ℝ) + (p : ℝ) ^ c ∧
    a * b ≡ 1 [MOD p]

end Erdos445
