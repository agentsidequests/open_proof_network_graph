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

/-! Ported mechanically from `FormalConjectures/ErdosProblems/1221.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Erdős Problem 1221

*References:*
- [erdosproblems.com/1221](https://www.erdosproblems.com/1221)
- [dBEr49] de Bruijn, N. G. and Erdős, P., *Sequences of points on a circle*. Nederl. Akad.
  Wetensch., Proc. (1949), 14-17 = Indagationes Math. 11 (1949), 46-49.
  [PDF](https://www.renyi.hu/~p_erdos/1949-13.pdf)
-/

section

open Filter
open scoped ENNReal

namespace Erdos1221

/-- The first `n` points `a 0, …, a (n - 1)` of the sequence `a`, reduced modulo `1`, that is,
as points of the circle $\mathbb{R}/\mathbb{Z}$ of circumference $1$, in the form of a function on
`Fin n`. -/
noncomputable def pts (a : ℕ → ℝ) (n : ℕ) : Fin n → ℝ := fun j => Int.fract (a j)

/-- The points `pts a n` in non-decreasing order, so `sortedPoint a n i` is the `i`-th smallest
(counted from `0`). Repeated points are kept with their multiplicity. -/
noncomputable def sortedPoint (a : ℕ → ℝ) (n : ℕ) : Fin n → ℝ :=
  pts a n ∘ Tuple.sort (pts a n)

/-- The sorted points continued periodically to all of `ℕ`: going once around the circle adds
`1`. For `n = 0` the value is the junk value `0`. -/
noncomputable def unrolled (a : ℕ → ℝ) (n j : ℕ) : ℝ :=
  if h : 0 < n then sortedPoint a n ⟨j % n, Nat.mod_lt j h⟩ + ((j / n : ℕ) : ℝ) else 0

/-- The length of the arc that starts at the `i`-th sorted point and goes `r` points forward
around the circle (with the indices read cyclically). This is the total length of `r`
consecutive intervals determined by the first `n` points [dBEr49, §1], and the distance
$\lvert a_{i+r}-a_i\rvert$ "around the circle" of the problem. If two points coincide, the
corresponding interval has length `0`. -/
noncomputable def rSpan (a : ℕ → ℝ) (n r i : ℕ) : ℝ := unrolled a n (i + r) - unrolled a n i

/-- $M_n^{(r)}(a)$: the largest `r`-span of the first `n` points of `a`. For `n ≥ 1` this is a
maximum over the `n` starting points. For `n = 0` it is the junk value `0`. -/
noncomputable def maxSpan (a : ℕ → ℝ) (n r : ℕ) : ℝ := ⨆ i : Fin n, rSpan a n r i

/-- $m_n^{(r)}(a)$: the smallest `r`-span of the first `n` points of `a`. For `n ≥ 1` this is a
minimum over the `n` starting points. For `n = 0` it is the junk value `0`. -/
noncomputable def minSpan (a : ℕ → ℝ) (n r : ℕ) : ℝ := ⨅ i : Fin n, rSpan a n r i

/-- $\Lambda_r=\inf_a\limsup_n nM_n^{(r)}(a)$, where $a$ runs over all sequences of reals (read
modulo $1$) whose points `Int.fract (a k)` are pairwise distinct, so that the first $n$ points
define $n$ intervals [dBEr49, §1]. The $\inf$ and $\limsup$ are taken in `ℝ≥0∞`, so a sequence
with unbounded $nM_n^{(r)}(a)$ contributes $\infty$. -/
noncomputable def bigLambda (r : ℕ) : ℝ≥0∞ :=
  ⨅ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    limsup (fun n : ℕ => ENNReal.ofReal ((n : ℝ) * maxSpan a n r)) atTop

/-- $\lambda_r=\sup_a\liminf_n nm_n^{(r)}(a)$, where $a$ runs over all sequences of reals (read
modulo $1$) whose points `Int.fract (a k)` are pairwise distinct. The $\sup$ and $\liminf$ are
taken in `ℝ≥0∞`. -/
noncomputable def smallLambda (r : ℕ) : ℝ≥0∞ :=
  ⨆ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    liminf (fun n : ℕ => ENNReal.ofReal ((n : ℝ) * minSpan a n r)) atTop

/-- $\mu_r=\inf_a\limsup_n M_n^{(r)}(a)/m_n^{(r)}(a)$, where $a$ runs over all sequences of reals
(read modulo $1$) whose points `Int.fract (a k)` are pairwise distinct. The $\inf$ and $\limsup$
are taken in `ℝ≥0∞`. For such $a$, $n\geq1$ and $r\geq1$ both spans are positive, so the
quotient is a positive real number. -/
noncomputable def mu (r : ℕ) : ℝ≥0∞ :=
  ⨅ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    limsup (fun n : ℕ => ENNReal.ofReal (maxSpan a n r) / ENNReal.ofReal (minSpan a n r)) atTop

end Erdos1221
