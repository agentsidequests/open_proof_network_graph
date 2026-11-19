import Mathlib
import Nodes.«spec-9ab4bdf6».Context

/-- A third-position condition on the calm points of the hole `variant-cce9b284--h6`, the first
step of condition N1 of annex `eaaf51ac…` on that hole: for every `m ≥ 1092` with `m + 1`
prime, either `m + 3` has at most four divisors `a` with `20 < a < m`, or the weighted divisor
count `G(m) = ∑_{i ≥ 0} 2^{-(i+1)} #{a : 20 < a < m, a ∣ m + i + 1}` of that hole exceeds
`99/100`. With `spec-23231427` (a calm `m ≥ 1092` has `m + 1` prime), every calm point has at
most four divisors of `m + 3` in `(20, m)`. -/
theorem Opn.erdos_257_calm_point_third_position :
    ∀ m : ℕ, 1092 ≤ m → (m + 1).Prime →
      {a : ℕ | 20 < a ∧ a < m ∧ a ∣ m + 3}.ncard ≤ 4 ∨
        (99 / 100 : ℝ) < ∑' i : ℕ, (1 / 2 : ℝ) ^ (i + 1) *
          ({a : ℕ | 20 < a ∧ a < m ∧ a ∣ m + i + 1}.ncard : ℝ) := by
  sorry
