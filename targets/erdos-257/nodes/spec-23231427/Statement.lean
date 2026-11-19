import Mathlib
import Nodes.«spec-23231427».Context

/-- The structure lemma for the calm points of the hole `variant-cce9b284--h6` (annex
`e0c02cd3…` on that hole), stated in positive form: for every `m ≥ 1092`, either `m + 1` is prime
and `(m + 2)/2` is prime or `4 ∣ m + 2` with `(m + 2)/4` prime, or the weighted divisor count
`G(m) = ∑_{i ≥ 0} 2^{-(i+1)} #{a : 20 < a < m, a ∣ m + i + 1}` of that hole exceeds `99/100`.
So every calm point `m ≥ 1092` (one with `G(m) ≤ 99/100`) has `m + 1` and `(m + 2)/2` or
`(m + 2)/4` prime, and the hole implies the prime-pair statement `spec-001a7622`. The natural
divisions are exact in the cases that matter (`m + 1` prime forces `m + 2` even). -/
theorem Opn.erdos_257_calm_point_structure :
    ∀ m : ℕ, 1092 ≤ m →
      ((m + 1).Prime ∧ (((m + 2) / 2).Prime ∨ (4 ∣ m + 2 ∧ ((m + 2) / 4).Prime))) ∨
        (99 / 100 : ℝ) < ∑' i : ℕ, (1 / 2 : ℝ) ^ (i + 1) *
          ({a : ℕ | 20 < a ∧ a < m ∧ a ∣ m + i + 1}.ncard : ℝ) := by
  sorry
