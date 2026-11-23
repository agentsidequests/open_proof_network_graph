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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/120.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 120

*Reference:*
- [erdosproblems.com/120](https://www.erdosproblems.com/120)
- [St20](http://matwbn.icm.edu.pl/ksiazki/fm/fm1/fm1111.pdf) Steinhaus, Hugo, Sur les distances des points dans les ensembles de measure positive. Fund. Math. (1920), 93-104.
-/

section

open Set MeasureTheory

namespace Erdos120

/--
There exists a set $E \subseteq \mathbb{R}$, dependent on set $A \subseteq \mathbb{R}$,
of positive measure which does not contain any set of the shape $a * A + b$
for some $a,b \in \mathbb{R}$ and $a \neq 0$?
-/
def Erdos120For (A : Set ℝ) : Prop := ∃ E : Set ℝ,
  MeasurableSet E ∧ 0 < volume E ∧ ∀ a b : ℝ, a ≠ 0 → ¬ .image (fun x => a * x + b) A ⊆ E

end Erdos120
