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
import Defs.AnalysisSpecialFunctionsAdditiveCharacter
import Defs.Local

/-! Erdős problem 1004: For any fixed c > 0, if x is sufficiently large then there exists n ≤ x such that the values of φ(n+k) are all distinct for 1 ≤ k ≤ (log x)^c. — imported from google-deepmind/formal-conjectures (FormalConjectures/ErdosProblems/1004.lean at d8d031d4998c78575159ccab9a7a9e95ce043883, Apache-2.0); stated as the registry states it; the names it takes from its file or the registry's library are ported mechanically under defs/ (R12, F14-T19). Drafted by gate/tools/wave.py (F14-T11) and read by the curator before import (R13). -/

open Filter Real Nat
open Erdos1004

theorem Opn.erdos_1004 :
    ∀ c > (0 : ℝ), ∀ᶠ x in atTop, ∃ n ≤ x,
      IsDistinctTotientRun n ⌊(Real.log (x : ℝ)) ^ c⌋₊ := by
  sorry
