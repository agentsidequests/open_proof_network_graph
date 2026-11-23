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
import Defs.DataNatPrimeComposite
import Defs.FieldTheoryMilnorKTheory
import Defs.GroupTheoryRationalClasses
import Defs.NumberTheoryCoveringSystem
import Defs.NumberTheorySierpinskiNumber

/-! Ported mechanically from `FormalConjectures/ErdosProblems/1113.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 1113

*References:*
- [erdosproblems.com/1113](https://www.erdosproblems.com/1113)
- [ErGr80] Erdős, P. and Graham, R. L., Old and New Problems and Results in Combinatorial
  Number Theory. Monographie de l'Enseignement Mathématique, No. 28 (1980).
- [Si60] Sierpiński, W., Elementary Theory of Numbers. Państwowe Wydawnictwo Naukowe,
  Warsaw (1960).
- [FFK08] Filaseta, M., Finch, C., and Kozek, M., On powers associated with Sierpiński numbers,
  Riesel numbers and Polignac's conjecture. Journal of Number Theory 128 (2008), 1916–1940.

A positive odd integer $k$ is a *Sierpiński number* if $k \cdot 2^n + 1$ is composite for all
$n \geq 0$. A *covering set* for $k$ is a finite set of primes $P$ such that every number of
the form $k \cdot 2^n + 1$ is divisible by at least one prime in $P$.

Sierpiński (1960) proved that infinitely many Sierpiński numbers exist using covering systems.
The smallest known Sierpiński number is 78557 (Selfridge). Erdős and Graham conjectured that
there exist Sierpiński numbers with no finite covering set. A negative answer would imply
infinitely many Fermat primes.

Note: The notion of a covering set for a Sierpiński number is closely related to a
`CoveringSystem` of $\mathbb{Z}$ (see
`FormalConjecturesForMathlib.NumberTheory.CoveringSystem`): a finite covering set of primes
for $k$ works because the exponents $n$ for which each prime divides $k \cdot 2^n + 1$ form
residue classes whose union covers all of $\mathbb{Z}$, i.e. a covering system.

See also Erdős Problems [203](https://www.erdosproblems.com/203) and
[276](https://www.erdosproblems.com/276).
-/

section

namespace Erdos1113

/--
A *covering set* for a positive odd integer $k$ is a finite set of primes $P$ such that every
number of the form $k \cdot 2^n + 1$ is divisible by at least one prime in $P$.
-/
def HasFinitePrimeCoveringSet (k : ℕ) : Prop :=
  ∃ P : Finset ℕ, (∀ p ∈ P, p.Prime) ∧ ∀ n, ∃ p ∈ P, p ∣ (k * 2 ^ n + 1)

end Erdos1113
