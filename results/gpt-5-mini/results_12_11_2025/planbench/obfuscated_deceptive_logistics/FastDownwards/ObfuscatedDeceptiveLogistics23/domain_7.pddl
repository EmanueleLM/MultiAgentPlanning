(define (domain ObfuscatedDeceptiveLogistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; static (time-invariant) properties
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)

    ;; dynamic (stage-indexed) relations
    (next_at ?x - obj ?y - obj ?s - stage)
    (vase_at ?x - obj ?y - obj ?s - stage)

    ;; control of discrete-stage progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Actions follow the exact positive and negative effects from the specification.
  ;; Each action consumes the current stage and advances to a successor stage; all
  ;; preconditions are checked at the current stage (for stage-indexed fluents) or
  ;; globally for static fluents. Effects place the postconditions at the successor
  ;; stage and enforce specified deletions at the successor stage (no other deletions
  ;; are introduced).
  (:action paltry
    :parameters (?o0 ?o1 ?o2 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase_at ?o0 ?o1 ?s)
      (next_at ?o1 ?o2 ?s)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; specified positive/negative effects at successor stage
      (next_at ?o0 ?o2 ?s2)
      (not (vase_at ?o0 ?o1 ?s2))
    )
  )

  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next_at ?o0 ?o2 ?s)
      (next_at ?o1 ?o2 ?s)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (vase_at ?o0 ?o1 ?s2)
      (not (next_at ?o0 ?o2 ?s2))
    )
  )

  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next_at ?o1 ?o2 ?s)
      (next_at ?o0 ?o2 ?s)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (vase_at ?o0 ?o1 ?s2)
      (not (next_at ?o0 ?o2 ?s2))
    )
  )

  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next_at ?o0 ?o1 ?s)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (next_at ?o0 ?o2 ?s2)
      (not (next_at ?o0 ?o1 ?s2))
    )
  )

  (:action memory
    :parameters (?o0 ?o1 ?o2 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next_at ?o0 ?o1 ?s)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (next_at ?o0 ?o2 ?s2)
      (not (next_at ?o0 ?o1 ?s2))
    )
  )

  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - obj ?s ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next_at ?o1 ?o2 ?s)
      (vase_at ?o0 ?o1 ?s)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (next_at ?o0 ?o2 ?s2)
      (not (vase_at ?o0 ?o1 ?s2))
    )
  )
)