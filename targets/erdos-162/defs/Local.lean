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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/162.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 162

*References:*
- [erdosproblems.com/162](https://www.erdosproblems.com/162)
- [Er90b] Erdős, Paul, *Problems and results on graphs and hypergraphs: similarities and
  differences*. Mathematics of Ramsey theory (1990), 12-28.
-/

section

open Filter Asymptotics

namespace Erdos162

/-- The number of edges of $K_n$ inside `H` that get colour `b` under the colouring `c`. -/
def colourEdgeCount {n : ℕ} (c : Sym2 (Fin n) → Bool) (H : Finset (Fin n)) (b : Bool) : ℕ :=
  (H.sym2.filter (fun e ↦ ¬ e.IsDiag ∧ c e = b)).card

/-- Every set `H` of at least `k` vertices contains more than $\alpha\binom{|H|}{2}$ edges of
each colour under `c`. -/
def IsBalancedAbove (n : ℕ) (α : ℝ) (c : Sym2 (Fin n) → Bool) (k : ℕ) : Prop :=
  ∀ H : Finset (Fin n), k ≤ H.card → ∀ b : Bool,
    α * (H.card.choose 2 : ℝ) < colourEdgeCount c H b

/-- $F(n, \alpha)$: the smallest `k` such that some 2-colouring of $K_n$ satisfies
`IsBalancedAbove n α c k`.

The source says "largest `k`". Read literally, every `k > n` works vacuously, so no largest `k`
exists. The smallest `k` is the reading consistent with the stated $\Theta(\log n)$ growth. -/
noncomputable def F (n : ℕ) (α : ℝ) : ℕ :=
  sInf {k : ℕ | ∃ c : Sym2 (Fin n) → Bool, IsBalancedAbove n α c k}

end Erdos162
