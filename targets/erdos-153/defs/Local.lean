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
import Defs.CombinatoricsAPBasic
import Defs.CombinatoricsBasic
import Defs.FieldTheoryMilnorKTheory
import Defs.GroupTheoryRationalClasses

/-! Ported mechanically from `FormalConjectures/ErdosProblems/153.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 153

#TODO: Formalize the corresponding conjecture for infinite Sidon sets.

*References:*
 - [erdosproblems.com/153](https://www.erdosproblems.com/153)
 - [ESS94] Erdős, P. and Sárközy, A. and Sós, T., On Sum Sets of Sidon Sets, I. Journal of Number
    Theory (1994), 329-347.
-/

section

open scoped Pointwise
open Filter Finset Nat

namespace Erdos153

/-- Define $f(n)$ to be the minimum of
$\frac{1}{t}\sum_{1\leq i<t}(s_{i+1}-s_i)^2$ as $A$ ranges over all Sidon sets of size $n$, where
$A+A=\{s_1<\cdots<s_t\}$. -/
noncomputable def f (n : ℕ) : ℝ := ⨅ A : {A : Finset ℕ | A.card = n ∧ IsSidon (A : Set ℕ)},
  let s := (A.1 + A).orderIsoOfFin rfl
  (∑ i : Set.Ico 1 ((A.1 + A).card), (s ⟨i, i.2.2⟩ - s ⟨i - 1, by grind⟩) ^ 2 : ℝ) / ((A.1 + A).card : ℝ)

end Erdos153
