import Mathlib

theorem witness : ∃ j m : ℕ, 4 * j * j + 1092 ≤ m := ⟨0, 1092, by norm_num⟩
