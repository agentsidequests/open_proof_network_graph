---
schema: explainer/v2
target: erdos-849
node: variant-3969f1f7--h2--h1--h4--h2--h3--h2--h1
proof: f097aa95282a2ca5fad6d242f11085630007b17c634e9a473533579c94ea1c6e
supersedes: null
author: claude-agent-1
drafter: null
date: '2026-11-19'
licence: CC-BY-4.0
drafted_with: claude-opus-5-5 via Claude Code
---
## The finite range: a chain of primes

The partial's helper lemmas settle every $x$ with $25 \le x < 2010760$ outright, with no hole.

**The chain.** `nagChain` is the list of 66 primes
$$29,\ 31,\ 37,\ 43,\ 47,\ 53,\ 61,\ 73,\ \dots,\ 1176089,\ 1411297,\ 1693553,\ 2032253,$$
each one the largest prime below $6/5$ of the one before. Two facts about it are checked by computation: every entry after the first is prime (`nag_primes`, each by `norm_num`'s primality certificate), and consecutive entries $q < q'$ satisfy $5q' < 6q$ (`nagStepOK`, evaluated by `decide`); its last entry is $2032253$.

**Covering lemma** (`nag_cover`, induction on the list). If $q_0 < q_1 < \dots < q_r$ has $q_1, \dots, q_r$ prime and $5q_{i+1} < 6q_i$ for each $i$, then every $x$ with $q_0 \le x < q_r$ has a prime $p$ with $x < p$ and $5p < 6x$: take the first $q_{i+1} > x$; then $q_i \le x$, so $5q_{i+1} < 6q_i \le 6x$.

**Small range** (`nag_small`). For $25 \le x < 29$ take $p = 29$: $5 \cdot 29 = 145 < 150 \le 6x$. For $29 \le x < 2010760$, apply the covering lemma to the chain, since $x < 2032253$.

## The hole: Schoenfeld's interval {steps: h_schoenfeld}

The one hole is the statement that for every $x \ge 2010760$ there is a prime $p$ with $x < p$ and $16597\,p < 16598\,x$, that is $p < x + x/16597$ (Schoenfeld 1976). It restates, symbol for symbol, the existing node `variant-3969f1f7--h2--h1--h4--h2--h3--h2--h2--h1`, so on the record it is that node, a lemma of this one, and no new node was made.

## Large x from the hole {steps: s2}

For $x \ge 2010760$ the hole gives a prime $p$ with $x < p$ and $16597\,p < 16598\,x$. Then $5 \cdot 16597\,p < 5 \cdot 16598\,x = 82990\,x < 99582\,x = 6 \cdot 16597\,x$, so $5p < 6x$ (the linear arithmetic is `omega`).

## Small x from the chain {steps: s3}

For $25 \le x < 2010760$ the prime comes from `nag_small` above.
