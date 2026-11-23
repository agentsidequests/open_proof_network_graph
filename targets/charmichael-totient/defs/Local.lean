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

/-! Ported mechanically from `FormalConjectures/Wikipedia/CarmichaelTotient.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Carmichael's totient function conjecture

For every positive natural number $n$, there exists a natural number $m$ with $m ≠ n$, such that
$φ(n) = φ(m)$ where $φ$ is the Euler totient function.

*References:*
- [Wikipedia](https://en.wikipedia.org/wiki/Carmichael%27s_totient_function_conjecture)
- [F1998] Kevin Ford. The distribution of totients. https://arxiv.org/abs/1104.3264
-/

section

universe u v

open Nat

namespace CarmichaelTotient

/-- Natural number $n$ for which there exists a $m ≠ n$ with $φ(m) = φ(n)$ -/
def CarmichaelTotientFor (n : ℕ) : Prop := ∃ m : ℕ, m ≠ n ∧ φ m = φ n

-- TODO: Version of this ↓ lemma to mathlib?

end CarmichaelTotient
