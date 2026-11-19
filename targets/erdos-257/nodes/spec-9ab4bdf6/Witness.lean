import Mathlib

theorem witness : ∃ m : ℕ, 1092 ≤ m ∧ (m + 1).Prime := ⟨1092, le_refl _, by norm_num⟩
