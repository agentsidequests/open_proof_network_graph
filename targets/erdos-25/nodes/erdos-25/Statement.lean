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

import Mathlib
import Defs.AlgebraOrderGroupPointwiseInterval
import Defs.AnalysisSpecialFunctionsAdditiveCharacter
import Defs.DataSetDensity
import Defs.DataSetInterval
import Defs.OrderIntervalFinsetBasic
import Defs.OrderIntervalFinsetNat

/-! Erdős problem 25: Let $n_1 < n_2 < \dots$ be an arbitrary sequence of integers, each with an associated residue class $a_i \pmod{n_i}$. — imported from google-deepmind/formal-conjectures (FormalConjectures/ErdosProblems/25.lean at d8d031d4998c78575159ccab9a7a9e95ce043883, Apache-2.0); stated as the registry states it; the names it takes from its file or the registry's library are ported mechanically under defs/ (R12, F14-T19). Drafted by gate/tools/wave.py (F14-T11) and read by the curator before import (R13). -/

open Filter Finset Real Nat Set
open scoped Topology

theorem Opn.erdos_25 :
    ∀ (seq_n : ℕ → ℕ) (seq_a : ℕ → ℤ), (∀ i, 0 < seq_n i) → StrictMono seq_n →
      ∃ d, Set.HasLogDensity
        { x : ℕ | ∀ i, (x : ℤ) < seq_n i ∨ ¬((x : ℤ) ≡ seq_a i [ZMOD seq_n i]) } d := by
  sorry
