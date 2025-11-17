(define (domain ObfuscatedDeceptiveLogistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    ; static (time-invariant) properties
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)

    ; time-indexed fluents: explicit discrete-time model (state at a time instant)
    (next ?x - obj ?y - obj ?t - time)    ; "next" relation at time ?t
    (vase ?x - obj ?y - obj ?t - time)    ; "vase" relation at time ?t

    ; explicit discrete time ordering
    (succ ?t1 - time ?t2 - time)
  )

  ; Each action is a transition from a time instant ?t to its immediate successor ?t2 (succ ?t ?t2).
  ; Preconditions refer to fluents at time ?t; effects establish the state at time ?t2.
  ; This makes temporal progression explicit and prevents implicit post-hoc fixes.

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1 ?t)
      (next ?o1 ?o2 ?t)
    )
    :effect (and
      ; add next for o0 at successor time
      (next ?o0 ?o2 ?t2)
      ; vase toggled off at successor time
      (not (vase ?o0 ?o1 ?t2))
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2 ?t)
      (next ?o1 ?o2 ?t)
    )
    :effect (and
      ; vase is created at successor time
      (vase ?o0 ?o1 ?t2)
      ; next relation for o0 to o2 does not hold at successor time
      (not (next ?o0 ?o2 ?t2))
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2 ?t)
      (next ?o0 ?o2 ?t)
    )
    :effect (and
      ; set vase at successor time
      (vase ?o0 ?o1 ?t2)
      ; remove next relation for o0->o2 at successor time
      (not (next ?o0 ?o2 ?t2))
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1 ?t)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      ; move next target for o0 from o1 (at time t) to o2 at successor time
      (next ?o0 ?o2 ?t2)
      (not (next ?o0 ?o1 ?t2))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1 ?t)
    )
    :effect (and
      (next ?o0 ?o2 ?t2)
      (not (next ?o0 ?o1 ?t2))
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2 ?t)
      (vase ?o0 ?o1 ?t)
    )
    :effect (and
      (next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1 ?t2))
    )
  )
)