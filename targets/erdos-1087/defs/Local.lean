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
import Defs.DataSetTriplewise
import Defs.DataSymSym2
import Defs.FieldTheoryMilnorKTheory
import Defs.Geometry2d
import Defs.GeometryMetric
import Defs.GroupTheoryRationalClasses
import Defs.LogicEquivFinRotate

/-! Ported mechanically from `FormalConjectures/ErdosProblems/1087.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 1087

*References:*
- [erdosproblems.com/1087](https://www.erdosproblems.com/1087)
- [ErPu71] Erdős, P. and Purdy, G., *Some extremal problems in geometry*. J. Combinatorial Theory
  Ser. A 10 (1971), 246-252.
-/

section

open Filter Asymptotics
open scoped EuclideanGeometry

namespace Erdos1087

/-- A finite set of points has a repeated distance if two of its pairs of points are the same
distance apart, that is, if it determines fewer distinct distances than it has pairs. -/
def HasRepeatedDistance (S : Finset ℝ²) : Prop :=
  distinctDistances S < S.card.choose 2

open scoped Classical in
/-- The number of degenerate four-element subsets of `P`, that is, those in which two of the six
pairwise distances are equal. -/
noncomputable def degenerateCount (P : Finset ℝ²) : ℕ :=
  ((P.powersetCard 4).filter HasRepeatedDistance).card

/-- $f(n)$: the maximum, over all sets of $n$ points in the plane, of the number of degenerate
four-element subsets. The set of values is nonempty and bounded by $\binom{n}{4}$, so `sSup` is
a true maximum. -/
noncomputable def f (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ P : Finset ℝ², P.card = n ∧ degenerateCount P = m}

end Erdos1087
