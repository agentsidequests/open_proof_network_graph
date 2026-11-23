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
import Defs.CombinatoricsSetFamilySunflower
import Defs.FieldTheoryMilnorKTheory
import Defs.GroupTheoryRationalClasses

/-! Ported mechanically from `FormalConjectures/ErdosProblems/20.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 20

*References:*
* [erdosproblems.com/20](https://www.erdosproblems.com/20)
* [Wikipedia](https://en.wikipedia.org/wiki/Sunflower_(mathematics))
* [ErRa60] Erdős, Paul and Rado, Richard. Intersection theorems for systems of sets.
  J. London Math. Soc. 35 (1960), 85--90.

-/

section
namespace Erdos20

/--
Let $f(n,k)$ be minimal such that every $F$ family of $n$-uniform sets with $|F| \ge f(n,k)$
contains a $k$-sunflower.
-/
noncomputable def f (n k : ℕ) : ℕ :=
  sInf {m | ∀ {α : Type}, ∀ (F : Set (Set α)),
    ((∀ f ∈ F, f.ncard = n) ∧ m ≤ F.ncard) → ∃ S ⊆ F, S.ncard = k ∧ IsSunflower S}

-- TODO(firsching): add the various known bounds as variants.

end Erdos20
