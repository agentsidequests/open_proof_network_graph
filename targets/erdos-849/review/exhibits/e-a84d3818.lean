-- opn-review: {"cand": "c-11841605", "op": "compile"}
import Mathlib

namespace C_c_11841605
/-- Erdős 849, counting solutions: for every integer `t ≥ 1` there is an integer `a` such that
the equation `C(n, k) = a` has exactly `t` solutions `(n, k)` with `1 ≤ k ≤ n / 2`. -/
theorem claim : ∀ t : ℕ, 1 ≤ t →
    ∃ a : ℕ, {p : ℕ × ℕ | 1 ≤ p.2 ∧ p.2 ≤ p.1 / 2 ∧ Nat.choose p.1 p.2 = a}.ncard = t := by
  sorry
end C_c_11841605
