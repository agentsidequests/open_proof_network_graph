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

/-! Ported mechanically from `FormalConjectures/Wikipedia/CollatzConjecture.lean` at registry commit d8d031d4998c78575159ccab9a7a9e95ce043883 (google-deepmind/formal-conjectures, Apache-2.0) by gate/tools/wave.py (F14-T19): the file's own definitions, without the conjectures it states and their tests. The module syntax is stripped so the gate elaborates it under `import Mathlib`; nothing else is changed. -/

/-!
# Collatz conjecture

*References:*
* [Wikipedia](https://en.wikipedia.org/wiki/Collatz_conjecture)
* [erdosproblems.com/1135](https://www.erdosproblems.com/1135)
* [Gu04] Guy, Richard K., Unsolved problems in number theory. (2004), xviii+437.
* [La10] Lagarias, Jeffrey C., The {$3x+1$} problem: an overview. (2010), 3--29.
* [La16] Lagarias, Jeffrey C., Erdős, Klarner, and the {$3x+1$} problem. Amer. Math. Monthly
  (2016), 753--776.
* [La85] Lagarias, Jeffrey C., The {$3x+1$} problem and its generalizations. Amer. Math. Monthly
  (1985), 3--23.
-/

section

namespace CollatzConjecture

/--
Consider the following operation on the natural numbers:
If the number is even, divide it by two.
If the number is odd, triple it and add one.
-/
def collatzStep (n : ℕ) : ℕ :=
  if Even n then n / 2 else 3 * n + 1

end CollatzConjecture
