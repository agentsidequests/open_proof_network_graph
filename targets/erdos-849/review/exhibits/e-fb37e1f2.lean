-- opn-review: {"a": "c-11841605", "b": "c-fb339e85", "case": null, "direction": "forward", "kind": "proof", "op": "pair-proof"}
import Mathlib

namespace C_c_11841605_p
/-- Erdős 849, counting solutions: for every integer `t ≥ 1` there is an integer `a` such that
the equation `C(n, k) = a` has exactly `t` solutions `(n, k)` with `1 ≤ k ≤ n / 2`. -/
def opnClaim : Prop :=
  ∀ t : ℕ, 1 ≤ t →
    ∃ a : ℕ, {p : ℕ × ℕ | 1 ≤ p.2 ∧ p.2 ≤ p.1 / 2 ∧ Nat.choose p.1 p.2 = a}.ncard = t

end C_c_11841605_p

namespace C_c_fb339e85_p
/-- Erdős 849 read literally: for every t ≥ 1 some a has exactly t solutions (n, k) of
C(n, k) = a with 1 ≤ k ≤ n/2, counted as pairs, with `encard` so an infinite solution set
is never mistaken for a finite count. -/
def opnClaim : Prop :=
  ∀ t : ℕ, 1 ≤ t → ∃ a : ℕ,
    {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.encard = t

end C_c_fb339e85_p

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

private theorem pp_set_eq (a : ℕ) :
    {p : ℕ × ℕ | 1 ≤ p.2 ∧ p.2 ≤ p.1 / 2 ∧ Nat.choose p.1 p.2 = a} =
      {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a} := by
  ext ⟨n, k⟩
  simp only [Set.mem_setOf_eq]
  constructor
  · rintro ⟨h1, h2, h3⟩; exact ⟨h1, by omega, h3⟩
  · rintro ⟨h1, h2, h3⟩; exact ⟨h1, by omega, h3⟩

private theorem pp_root_mine : (∀ t ≥ 1, ∃ a : ℕ, {n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ Nat.choose n k = a}.ncard = t) ↔
    (∀ t : ℕ, 1 ≤ t →
    ∃ a : ℕ, {p : ℕ × ℕ | 1 ≤ p.2 ∧ p.2 ≤ p.1 / 2 ∧ Nat.choose p.1 p.2 = a}.ncard = t) := by
  simp only [pp_set_eq, ← pp_ncard_eq]

private theorem pp_fb_mine : (∀ t : ℕ, 1 ≤ t → ∃ a : ℕ,
    {p : ℕ × ℕ | 1 ≤ p.2 ∧ 2 * p.2 ≤ p.1 ∧ Nat.choose p.1 p.2 = a}.encard = t) ↔
    (∀ t : ℕ, 1 ≤ t →
    ∃ a : ℕ, {p : ℕ × ℕ | 1 ≤ p.2 ∧ p.2 ≤ p.1 / 2 ∧ Nat.choose p.1 p.2 = a}.ncard = t) := by
  simp only [pp_set_eq, Set.Finite.encard_eq_coe_toFinset_card (pp_pairs_finite _)]
  constructor
  · intro h t ht; obtain ⟨a, ha⟩ := h t ht; refine ⟨a, ?_⟩
    rw [Set.ncard_eq_toFinset_card _ (pp_pairs_finite a)]; exact_mod_cast ha
  · intro h t ht; obtain ⟨a, ha⟩ := h t ht; refine ⟨a, ?_⟩
    rw [Set.ncard_eq_toFinset_card _ (pp_pairs_finite a)] at ha; exact_mod_cast ha
-- opn-pair-proof: helpers end
set_option maxHeartbeats 1000000 in
theorem opnDirection : C_c_11841605_p.opnClaim → C_c_fb339e85_p.opnClaim := by
  intro h
  -- opn-pair-proof: proof begins (an indented tactic block, to the end of the file)
  unfold C_c_11841605_p.opnClaim at h
  unfold C_c_fb339e85_p.opnClaim
  exact (pp_fb_mine).mpr h
