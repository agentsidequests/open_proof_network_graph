import Mathlib
import Nodes.«spec-2690fb43».Context

/-- The barrier for the calm-points hole `variant-cce9b284--h6`: the hole implies a
twin-prime-type statement. If every interval `(n, 2n - 10]` with `n ≥ 1092` contains a calm point
`m` (weighted divisor count at most `99/100`, verbatim the statement of `variant-cce9b284--h6`),
then every such interval contains `m = 2q - 2` or `m = 4q - 2` with `q` and `m + 1` both prime.
The implication `H → P` is written in the classically equivalent form `¬ H ∨ P` because `H` is
the open hole itself: nobody can exhibit a witness of it, which a hypothesis would require. -/
theorem calm_points_imply_prime_pairs :
  ¬ (∀ n : ℕ, 1092 ≤ n → ∃ m : ℕ, n < m ∧ m + 10 ≤ 2 * n ∧
     ∑' i : ℕ, (1 / 2 : ℝ) ^ (i + 1) * (({a : ℕ | 20 < a ∧ a < m ∧ a ∣ m + i + 1}.ncard : ℕ) : ℝ) ≤ 99 / 100) ∨
  (∀ n : ℕ, 1092 ≤ n → ∃ q : ℕ, q.Prime ∧
     ((n < 2*q - 2 ∧ 2*q + 8 ≤ 2*n ∧ (2*q - 1).Prime) ∨
      (n < 4*q - 2 ∧ 4*q + 8 ≤ 2*n ∧ (4*q - 1).Prime))) := by
  sorry
