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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/420.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 420

*References:*
- [erdosproblems.com/420](https://www.erdosproblems.com/420)
- [ErGr80] Erdős, P. and Graham, R., *Old and new problems and results in combinatorial number
  theory*. Monographies de L'Enseignement Mathematique (1980).
- [EGIP96] Erdős, P. and Graham, S. W. and Ivić, A. and Pomerance, C., *On the number of divisors
  of $n!$*. Analytic number theory, Vol. 1 (Allerton Park, IL, 1995), Progr. Math. 138, Birkhäuser
  Boston (1996), 337-355.

In the solved variants, $K(n)$ is the least $K \geq 1$ with $\tau((n+K)!) \geq 2\tau(n!)$, so that
$K(n) > h$ if and only if $F(h, n) < 2$. These variants state Corollaries 2 and 3 of [EGIP96] as
printed; the stronger claims on erdosproblems.com are not stated.
-/

section

open Filter
open scoped ArithmeticFunction.sigma

namespace Erdos420

/--
`F f n` is
$$F(f,n)=\frac{\tau((n+\lfloor f(n)\rfloor)!)}{\tau(n!)},$$
where $\tau = \sigma_0$ counts divisors. We use the natural floor `⌊f n⌋₊`, which agrees with
$\lfloor f(n) \rfloor$ when $f(n) \geq 0$ and is $0$ when $f(n) < 0$.
-/
noncomputable def F (f : ℕ → ℝ) (n : ℕ) : ℝ :=
  (σ 0 (n + ⌊f n⌋₊).factorial : ℝ) / (σ 0 n.factorial : ℝ)

end Erdos420
