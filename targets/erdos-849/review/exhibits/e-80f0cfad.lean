-- opn-review: {"a": "c-ae9bea28", "b": "c-fb339e85", "case": null, "direction": "backward", "kind": "proof", "op": "pair-proof"}
import Mathlib

namespace C_c_fb339e85_p
/-- Erdős 849 read literally: for every t ≥ 1 some a has exactly t solutions (n, k) of
C(n, k) = a with 1 ≤ k ≤ n/2, counted as pairs, with `encard` so an infinite solution set
is never mistaken for a finite count. -/
def opnClaim : Prop :=
  ∀ t : ℕ, 1 ≤ t → ∃ a : ℕ,
    {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.encard = t

end C_c_fb339e85_p

namespace C_c_ae9bea28_p
/-
Copyright 2025 The Formal Conjectures Authors.

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



/-! Erdős problem 849: Is it true that, for every integer $t\geq1$, there is some integer $a$ such that ${n \choose k} = a$ with $1\leq k \le \frac{n}{2}$ has exactly $t$ solutions? — imported from google-deepmind/formal-conjectures (FormalConjectures/ErdosProblems/849.lean at c7f31d5fd3d2ca3d69979f2d213eb9b58fe956ae, Apache-2.0); the registry states a yes/no question as `answer(sorry) ↔ P`; this states P, its affirmative reading (F11-Q24). Drafted by gate/tools/wave.py (F14-T11) and read by the curator before import (R13). -/

open Nat

def opnClaim : Prop :=
  ∀ t ≥ 1, ∃ a : ℕ,
      {n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ choose n k = a}.ncard = t

end C_c_ae9bea28_p

-- opn-pair-proof: helpers begin (private theorem, lemma, def or abbrev declarations only)
private theorem pp_choose_strict_k (n k : ℕ) (hk : 2 * (k + 1) ≤ n) :
    Nat.choose n k < Nat.choose n (k + 1) := by
  have e : Nat.choose n (k + 1) * (k + 1) = Nat.choose n k * (n - k) := Nat.choose_succ_right_eq n k
  have hpos : 0 < Nat.choose n k := Nat.choose_pos (by omega)
  have h1 : Nat.choose n k * (k + 1) < Nat.choose n k * (n - k) :=
    Nat.mul_lt_mul_of_pos_left (by omega) hpos
  rw [← e] at h1
  exact Nat.lt_of_mul_lt_mul_right h1

private theorem pp_choose_inj_k (n k k' : ℕ) (hk : 2 * k ≤ n) (hk' : 2 * k' ≤ n)
    (h : Nat.choose n k = Nat.choose n k') : k = k' := by
  have mono : ∀ j m : ℕ, j < m → 2 * m ≤ n → Nat.choose n j < Nat.choose n m := by
    intro j m hjm hm
    induction m, hjm using Nat.le_induction with
    | base => exact pp_choose_strict_k n j hm
    | succ m hjm ih =>
      exact lt_trans (ih (by omega)) (pp_choose_strict_k n m hm)
  by_contra hne
  rcases Nat.lt_or_gt_of_ne hne with hlt | hlt
  · have := mono k k' hlt hk'; omega
  · have := mono k' k hlt hk; omega

private theorem pp_choose_mono_k (n j : ℕ) :
    ∀ k : ℕ, j ≤ k → 2 * k ≤ n → Nat.choose n j ≤ Nat.choose n k := by
  intro k hjk hk
  induction k, hjk using Nat.le_induction with
  | base => exact le_rfl
  | succ k hjk ih =>
    exact le_trans (ih (by omega)) (Nat.choose_le_succ_of_lt_half_left (by omega))

private theorem pp_pairs_finite (a : ℕ) :
    {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.Finite := by
  apply ((Set.finite_Iic a).prod (Set.finite_Iic a)).subset
  rintro ⟨n, k⟩ ⟨h1, h2, h3⟩
  simp only [Set.mem_prod, Set.mem_Iic]
  have hn : n ≤ Nat.choose n k := by
    have := pp_choose_mono_k n 1 k h1 h2
    simpa using this
  simp only at h1 h2 h3
  exact ⟨by omega, by omega⟩

private theorem pp_rows_eq (a : ℕ) :
    {n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ Nat.choose n k = a} =
      Prod.fst '' {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a} := by
  ext n
  simp only [Set.mem_setOf_eq, Set.mem_image, Prod.exists, exists_and_right, exists_eq_right]

private theorem pp_ncard_eq (a : ℕ) :
    {n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ Nat.choose n k = a}.ncard =
      {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.ncard := by
  rw [pp_rows_eq a]
  apply Set.ncard_image_of_injOn
  rintro ⟨n, k⟩ ⟨_, hk2, hk3⟩ ⟨n', k'⟩ ⟨_, hk2', hk3'⟩ hfst
  simp only at hfst hk2 hk3 hk2' hk3'
  subst hfst
  have : k = k' := pp_choose_inj_k n k k' hk2 hk2' (by rw [hk3, hk3'])
  rw [this]

private theorem pp_encard_eq (a : ℕ) :
    ({p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.encard : ℕ∞) =
      ({n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ Nat.choose n k = a}.ncard : ℕ∞) := by
  rw [pp_ncard_eq a, Set.Finite.cast_ncard_eq (pp_pairs_finite a)]
-- opn-pair-proof: helpers end
set_option maxHeartbeats 1000000 in
theorem opnDirection : C_c_fb339e85_p.opnClaim → C_c_ae9bea28_p.opnClaim := by
  intro h
  -- opn-pair-proof: proof begins (an indented tactic block, to the end of the file)
  unfold C_c_fb339e85_p.opnClaim at h
  unfold C_c_ae9bea28_p.opnClaim
  intro t ht
  obtain ⟨a, ha⟩ := h t ht
  refine ⟨a, ?_⟩
  rw [pp_encard_eq a] at ha
  exact_mod_cast ha
