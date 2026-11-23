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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/430.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 430

*References:*
- [erdosproblems.com/430](https://www.erdosproblems.com/430)
- [ErGr80] Erdős, P. and Graham, R., *Old and new problems and results in combinatorial number
  theory*. Monographies de L'Enseignement Mathematique (1980).

The question is equivalent to the first part of
[Erdős Problem 385](https://www.erdosproblems.com/385) (an observation of Sarosh Adenwalla
recorded on both problem pages).
-/

section

namespace Erdos430

open Filter

/--
The terms of the sequence of Erdős Problem 430 for a given $n$: the integers $m$ with
$1 < m < n$ all of whose prime factors are $> n - m$.

The decreasing sequence $a_1 > a_2 > \cdots$ of the problem lists the elements of this set in
decreasing order: $a_1 = n - 1$ is its largest element and $a_k$ is its largest element below
$a_{k-1}$. The integer $1$ has no prime factors and is not a term of the sequence, which stops
instead, as in the example on erdosproblems.com: for $n = 8$ the sequence is $7, 5$.
-/
def terms (n : ℕ) : Finset ℕ := (Finset.Ioo 1 n).filter fun m => ∀ p ∈ m.primeFactors, n - m < p

end Erdos430
