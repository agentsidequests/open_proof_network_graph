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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/291.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 291

*References:*
- [erdosproblems.com/291](https://www.erdosproblems.com/291)
- [ErGr80, p.34] Erdős, P. and Graham, R., Old and new problems and results in combinatorial number
  theory. Monographies de L'Enseignement Mathematique (1980).
- [Sh16] P. Shiu, The denominators of harmonic numbers. arXiv:1607.02863 (2016).
- [WuYa22] Wu, Bing-Ling and Yan, Xiao-Hui, On the denominators of harmonic numbers. {IV}. C. R.
  Math. Acad. Sci. Paris (2022), 53--57.
-/

section

open Nat Finset Set Filter

namespace Erdos291

/--
$L_n$ is the least common multiple of $\{1,\ldots,n\}$.
-/
def L (n : ℕ) : ℕ :=
  (Finset.Icc 1 n).lcm (fun x ↦ x)

/--
$a_n$ is defined by $\sum_{1\leq k\leq n}\frac{1}{k}=\frac{a_n}{L_n}$.
-/
def a (n : ℕ) : ℕ :=
  ∑ k ∈ Finset.Icc 1 n, L n / k

end Erdos291
