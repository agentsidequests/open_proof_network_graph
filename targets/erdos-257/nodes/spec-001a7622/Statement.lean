import Mathlib
import Nodes.«spec-001a7622».Context

/-- A necessary condition for the calm-point hole `variant-cce9b284--h6` of the repair-walk route
to Erdős 257 (its "Set 9"), stated on its own because it is an open prime-pair conjecture.
Every interval `(n, 2n - 10]` with `n ≥ 1092` contains an `m = 2q - 2` or an `m = 4q - 2` with
`q` and `m + 1` both prime: a prime `q` with `2q - 1` prime and `n < 2q - 2 ≤ 2n - 10`, or with
`4q - 1` prime and `n < 4q - 2 ≤ 2n - 10`. By the structure lemma for calm points (annex
`e0c02cd3…` on the hole: a calm `m ≥ 1092` has `m + 1` prime and `(m + 2)/2` or `(m + 2)/4`
prime) the hole implies this statement. This statement does not imply the hole: a calm point
needs further conditions at `m + 3, m + 4, …`. It is a two-form instance of Dickson's conjecture
(the pair `q, 2q - 1` is a Cunningham chain of the second kind of length two) in a quantitative,
every-dyadic-interval form; even the infinitude of such `q` is not known. Since `q` is prime,
`q ≥ 2`, so the natural-number subtractions `2*q - 2`, `2*q - 1`, `4*q - 2`, `4*q - 1` are exact. -/
theorem dyadic_prime_pairs :
  ∀ n : ℕ, 1092 ≤ n → ∃ q : ℕ, q.Prime ∧
     ((n < 2*q - 2 ∧ 2*q + 8 ≤ 2*n ∧ (2*q - 1).Prime) ∨
      (n < 4*q - 2 ∧ 4*q + 8 ≤ 2*n ∧ (4*q - 1).Prime)) := by
  sorry
