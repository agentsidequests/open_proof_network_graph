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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/1146.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 1146

*References:*
- [erdosproblems.com/1146](https://www.erdosproblems.com/1146)
- [Ru99] Ruzsa, I., Erdős and the Integers. Journal of Number Theory (1999), 115-163.
-/

section

open scoped Pointwise

namespace Erdos1146

/--
We say that $A\subset \mathbb{N}$ is an essential component if $d_s(A \oplus B)>d_s(B)$ for every
$B\subset \mathbb{N}$ with $0<d_s(B)<1$ where $d_s$ is the Schnirelmann density.
Here, the sumset is the appropriate one for Schnirelmann density, $A \oplus B = \{a+b \mid a \in A \cup \{0\}, b \in B \cup \{0\}\}$ (i.e. $(A \cup \{0\}) + (B \cup \{0\})$).
This avoids the trivial case where the sumset misses $1$ simply because neither $A$ nor $B$ contains $0$.
-/
def IsEssentialComponent (A : Set ℕ) : Prop :=
  open scoped Classical in
  ∀ B : Set ℕ,
    let b := schnirelmannDensity B;
    0 < b → b < 1 → schnirelmannDensity ((A ∪ {0}) + (B ∪ {0})) > b

end Erdos1146
