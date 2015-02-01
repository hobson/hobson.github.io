---
layout: post
title: Automata and Machine Intelligence
---

More and more, the smart people I meet are talking about Automata, Natural Language Processing, and Graph Search (AI/MI Planning) all in the same breath. I've taken MOOCs on all 3 and played but think I need to revisit automata. Because math proofs rely on automata to model machine intelligence, they are at the core of understanding what is possible. And I'm finding some interesting connections to graph search that I missed the first time around. 

From Nau, D., "Current Trends in AI Planning", 2007, a reading requirmeent for the coursera AI Planning course:

    A state-transition system (or discrete-event system) is a 4-tuple:

        Σ = (S, A, E, γ)

    where:
    
        S = {s0, s1, s2, ...} is a set of states;
        A = {a1, a2, ...} is a set of actions, that is, state transitions whose occurrence is controlled by the plan executor;
        E = {e1, e2, ...} is a set of events, that is, state transitions whose occurrence is not controlled by the plan executor;
        γ : S × (A ∪ E) → 2S is a state-transition function.

    A state-transition system may be represented by a directed graph whose nodes are the states in S (for example, see figure 5).


From the Wikipedia article on finite state machines:

A deterministic finite state machine or acceptor deterministic finite state machine is:

A quintuple (\Sigma, S, s_0, \delta, F)

where:
    
**<math>\Sigma</math> is the input [[alphabet (computer science)|alphabet]] (a finite, non-empty set of symbols).
**<math>S</math> is a finite, non-empty set of states.
**<math>s_0</math> is an initial state, an element of <math>S</math>.
**<math>\delta</math> is the state-transition function: <math>\delta: S \times \Sigma \rightarrow S</math> (in a [[nondeterministic finite automaton]] it would be <math>\delta: S \times \Sigma \rightarrow \mathcal{P}(S)</math>, i.e., <math>\delta</math> would return a set of states).
**<math>F</math> is the set of final states, a (possibly empty) subset of <math>S</math>.

And the wikipedia article for automata:

:A deterministic finite '''automaton''' is represented formally by a [[N-tuple|5-tuple]] '''(Q,Σ,δ,q<sub>0</sub>,F)'''

where:

:*Q is a finite set of ''states''.
:*Σ is a finite set of ''[[symbol]]s'', called the ''[[alphabet (computer science)|alphabet]]'' of the automaton.
:*δ is the '''transition function''', that is, δ:&nbsp;Q&nbsp;×&nbsp;Σ&nbsp;→&nbsp;Q.
:*q<sub>0</sub> is the ''start state'', that is, the state of the automaton before any input has been processed, where q<sub>0</sub>∈ Q.
:*F is a set of states of Q (i.e. F⊆Q) called '''accept states'''.


Looks like a lot of overlap, now that I put them all together. What are the differences?