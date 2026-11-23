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
import Defs.ComputabilityTuringMachineBusyBeavers
import Defs.ComputabilityTuringMachineNotation
import Defs.ComputabilityTuringMachinePostTuringMachine
import Defs.FieldTheoryMilnorKTheory
import Defs.GroupTheoryRationalClasses

/-! Ported mechanically from `FormalConjectures/OptimizationConstants/6a.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Tao's Optimization Constant 6a / The Union-Closed Sets Conjecture

*References:*
- [Tao's Optimization Constant 6a](https://teorth.github.io/optimizationproblems/constants/6a.html)
- [F1995] Frankl, P., *Extremal set systems*. Handbook of Combinatorics (1995).
- [AHS2022] Alweiss, R., Huang, B. and Sellke, M., *Improved lower bound for the union-closed sets
  conjecture*. [arXiv:2211.11731](https://arxiv.org/abs/2211.11731)
- [CL2022] Chase, Z. and Lovett, S., *Approximate union closed conjecture*.
  [arXiv:2211.11689](https://arxiv.org/abs/2211.11689)
- [S2022] Sawin, W., *An improved lower bound for the union-closed set conjecture*.
  [arXiv:2211.11504](https://arxiv.org/abs/2211.11504)
- [C2022] Cambie, S., *Better bounds for the union-closed sets conjecture using the entropy
  approach*. [arXiv:2212.12500](https://arxiv.org/abs/2212.12500)
- [Y2022] Yu, L., *Dimension-free bounds for the union-closed sets conjecture*.
  [arXiv:2212.00658](https://arxiv.org/abs/2212.00658)
- [L2023] Liu, J., *Improving the lower bound for the union-closed sets conjecture via
  conditionally IID coupling*. [arXiv:2306.08824](https://arxiv.org/abs/2306.08824)
-/

section

open Finset

namespace Constant6a

/-- **Tao's Optimization Constant 6a / The union-closed sets conjecture**: the largest $c$ such
that every union-closed family $A \ne \{\emptyset\}$ of finite subsets of $\mathbb{N}$ (or any infinite set/type) has an
element that belongs to at least a $c$ fraction of its sets. -/

noncomputable def C6a : ℝ :=
  sSup {c : ℝ | ∀ (A : Finset (Finset ℕ)), A ≠ {∅} →
    (∀ᵉ (X ∈ A) (Y ∈ A), X ∪ Y ∈ A) → ∃ i, c * #A ≤ #{x ∈ A | i ∈ x}}

end Constant6a
