(define (domain rewire)
  ; Assumptions / notes (documenting in-PDDL comments):
  ; - This domain encodes the inferred "rewiring" semantics described by the agents.
  ; - Actions implemented (as requested): memory, sip, paltry, clip, wretched, tightfisted.
  ; - These actions and their preconditions/effects are the minimal semantics inferred from the agents'
  ;   analyses. They operate on predicate next to add or move adjacency relationships.
  ; - Where agents suggested optional extra preconditions (e.g., hand, texture), these are encoded
  ;   where used below. These additional preconditions were explicitly introduced based on the
  ;   agent analyses (they were present in the stated initial facts for the example problems).
  ; - No other predicates, objects, or hidden preconditions were introduced beyond those present
  ;   in the agent reports, except for the action schemas themselves as required.
  ; - Requirements chosen for FastDownward compatibility: :strips, :typing, :negative-preconditions.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (next ?x - object ?y - object)
    (hand ?x - object)
    (collect ?x - object ?y - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (texture ?x - object)
    (cats ?x - object)
  )

  ; memory X A B
  ; semantics (inferred): redirect X's neighbor from A to B.
  ; pre: next X A
  ; effect: add next X B, remove next X A
  (:action memory
    :parameters (?x - object ?a - object ?b - object)
    :precondition (next ?x ?a)
    :effect (and
              (next ?x ?b)
              (not (next ?x ?a))
            )
  )

  ; sip Y X B
  ; semantics (inferred): move Y from being next-to B to being next-to X
  ; pre: next Y B, next X B, (hand Y) -- hand requirement added per agent notes
  ; effect: add next Y X, remove next Y B
  (:action sip
    :parameters (?y - object ?x - object ?b - object)
    :precondition (and
                    (next ?y ?b)
                    (next ?x ?b)
                    (hand ?y)
                  )
    :effect (and
              (next ?y ?x)
              (not (next ?y ?b))
            )
  )

  ; paltry Y X A
  ; semantics (inferred): redirect Y's neighbor from X to A, using X->A link
  ; pre: next Y X, next X A, (hand Y) -- hand requirement added per agent notes
  ; effect: add next Y A, remove next Y X
  (:action paltry
    :parameters (?y - object ?x - object ?a - object)
    :precondition (and
                    (next ?y ?x)
                    (next ?x ?a)
                    (hand ?y)
                  )
    :effect (and
              (next ?y ?a)
              (not (next ?y ?x))
            )
  )

  ; clip X Y
  ; semantics (inferred, from planner_B): directly create an adjacency next X Y
  ; pre: hand X, texture Y  (texture requirement added per agent_B analysis)
  ; effect: add next X Y (additive; does not delete pre-existing next facts)
  (:action clip
    :parameters (?x - object ?y - object)
    :precondition (and
                    (hand ?x)
                    (texture ?y)
                  )
    :effect (and
              (next ?x ?y)
            )
  )

  ; tightfisted ITEM FROM TO
  ; semantics (inferred): transfer collection of ITEM from FROM to TO
  ; pre: collect ITEM FROM, hand TO
  ; effect: remove collect ITEM FROM, add collect ITEM TO
  (:action tightfisted
    :parameters (?item - object ?from - object ?to - object)
    :precondition (and
                    (collect ?item ?from)
                    (hand ?to)
                  )
    :effect (and
              (not (collect ?item ?from))
              (collect ?item ?to)
            )
  )

  ; wretched ITEM FROM TO
  ; semantics (alternative transfer action, same minimal semantics as tightfisted)
  ; pre: collect ITEM FROM, hand TO
  ; effect: remove collect ITEM FROM, add collect ITEM TO
  (:action wretched
    :parameters (?item - object ?from - object ?to - object)
    :precondition (and
                    (collect ?item ?from)
                    (hand ?to)
                  )
    :effect (and
              (not (collect ?item ?from))
              (collect ?item ?to)
            )
  )

)