---
layout: post
title: Automata and Machine Intelligence
---

More and more, the smart people I meet are talking about Automata, Natural Language Processing, and Graph Search (AI/MI Planning) all in the same breath. I've taken MOOCs on all 3 and played but think I need to revisit automata. Because math proofs rely on automata to model machine intelligence, they are at the core of understanding what is possible. And I'm finding some interesting connections to graph search that I missed the first time around. 

From Nau, D., "Current Trends in AI Planning", 2007, a reading requirmeent for the coursera AI Planning course:

> A state-transition system (or discrete-event system) is a 4-tuple:

> > Σ = (S, A, E, γ)

> where:
    
> > S = {s0, s1, s2, ...} is a set of states;
> > A = {a1, a2, ...} is a set of actions--state transitions controlled by the plan executor;
> > E = {e1, e2, ...} is a set of events--state transitions not controlled by a plan executor;
> > γ : S × (A ∪ E) → 2S is a state-transition function (an action for every possible state)

> A state-transition system may be represented by a directed graph whose nodes are the states
> in S (for example, see figure 5).


From the Wikipedia article on finite state machines:

> A deterministic finite state machine or acceptor deterministic finite state machine is:

> > A quintuple \\((\Sigma, S, s_0, \delta, F)\\)

where:
    
> \\(\Sigma\\) is the input alphabet (a finite, non-empty set of symbols).  
> \\(S\\) is a finite, non-empty set of states.  
> \\(s_0\\) is an initial state, an element of \\(S\\).  
> \\(\delta\\) is the state-transition function: \\(\delta: S \times \Sigma \rightarrow S\\) 
>     in a nondeterministic finite automaton it would be \\(\delta: S \times \Sigma \rightarrow \mathcal{P}(S)\\),  
>     i.e, \\(\delta\\) would return a set of states.  
> \\(F\\) is the set of final states, a (possibly empty) subset of \\(S\\).  

And the wikipedia article for automata:

> A deterministic finite '''automaton''' is represented formally by a 5-tuple \\((Q, \Sigma, \delta, q_0, F)\\)

where:

> \\(Q\\) is a finite set of states.  
> \\(\Sigma\\) is a finite set of symbols, called the alphabet of the automaton.  
> \\(\delta\\) is the transition function, that is, \\(\delta: Q \times \Sigma \rightarrow Q\\).  
> \\(q_0\\) is the start state, that is, the state of the automaton before any input has been processed,  
> where \\(q_0 > ∈ Q\\).  
> \\(F\\)is a set of states of \\(Q\\) (i.e. \\(F ⊆ Q\\)) called accept states.  

Looks like a lot of overlap, now that I put them all on the same page. They all three have a finite set of states, (\\S\\) or \\(Q\\). The state transition function is called \\(\gamma\\) in the AI Planning survey, but called \\(\delta\\). The automata have \\(\Sigma\\) as a set of input symbols but these correspond to actions that trigger state transitions, and AI Planning just enumerates theses symbols representing actions in the set \\(A\\). Producing a sequence of these that transition from a start state to a goal are the objective of an AI Planning system.

But my question is, for natural language processing, how do you design a finite state machine to take a sequence of symbols (utterances, phoenemes, words, or letters) and add some more edges or adjust the weights for an FSM that accumulates into massive "knowledge base" over time. This is what an "inside" friend of a friend of a friend said they do to accomplish dialog and query AI. I just am not following how you use natural language to program or edit an FSM. Basically that's an FSM that edits another larger FSM. And I can't figure out where AI planning (graph search) of the larger FSM comes into play.

Maybe the natural language sequence is used to do both. It adds some small bit of statistics to the accumulating statistics/weights along a few paths through the knowledge base graph (FSM) to a particular goal (another "path" of symbols to send back to the querier? rather than a single state or goal?). Maybe the output symbol is merely the single symbol/URI to a bit of content/info the user is seeking. And the user provides feedback on that "right" symbol by clicking or not clicking on several "hot" or "not" links or buttons after the natural language query. Discrete events that can be precisely quantified.