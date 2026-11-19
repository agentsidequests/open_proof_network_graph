import Mathlib
import Nodes.«spec-5e932b4b».Context

/-- The structure lemma for calm points with an arbitrary lower divisor bound `j`, the form used
by the hole `variant-cce9b284--h11` (where `j` is chosen by the prover): for every `j` and every
`m ≥ 4j² + 1092`, either `m + 1` is prime and `(m + 2)/2` is prime or `4 ∣ m + 2` with
`(m + 2)/4` prime, or the weighted divisor count
`G_j(m) = ∑_{i ≥ 0} 2^{-(i+1)} #{a : j < a < m, a ∣ m + i + 1}` exceeds `99/100`. So for every
`j`, every calm point `m ≥ 4j² + 1092` (one with `G_j(m) ≤ 99/100`) has `m + 1` and `(m + 2)/2`
or `(m + 2)/4` prime, and the hole implies that every interval `(n, 2n - 10]` with `n` large
holds such a prime pair. The natural divisions are exact in the cases that matter (`m + 1` prime
forces `m + 2` even). -/
theorem Opn.erdos_257_calm_point_structure_general :
    ∀ j m : ℕ, 4 * j * j + 1092 ≤ m →
      ((m + 1).Prime ∧ (((m + 2) / 2).Prime ∨ (4 ∣ m + 2 ∧ ((m + 2) / 4).Prime))) ∨
        (99 / 100 : ℝ) < ∑' i : ℕ, (1 / 2 : ℝ) ^ (i + 1) *
          ({a : ℕ | j < a ∧ a < m ∧ a ∣ m + i + 1}.ncard : ℝ) := by
  sorry
