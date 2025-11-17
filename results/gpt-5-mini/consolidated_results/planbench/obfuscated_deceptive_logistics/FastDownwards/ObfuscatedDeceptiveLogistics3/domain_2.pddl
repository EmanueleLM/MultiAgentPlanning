(define (domain obfuscated-deceptive-logistics3-temporal)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    ;; static/world properties (do not change over time)
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    ;; time-indexed fluents (change over discrete stages)
    (next_at ?x - obj ?y - obj ?t - time)
    (vase_at ?x - obj ?y - obj ?t - time)

    ;; ordered stage objects
    (succ ?t1 - time ?t2 - time)
  )

  ;; All actions explicitly consume a time step ?t and produce effects at the successor ?t1.
  ;; Each action requires (succ ?t ?t1) so time progression is explicit and non-oscillatory.

  ;; SIP
  (:action actor_a_sip
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next_at ?x ?z ?t)
      (next_at ?y ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (vase_at ?x ?y ?t1)
      (not (next_at ?x ?z ?t))
    )
  )

  (:action actor_b_sip
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next_at ?x ?z ?t)
      (next_at ?y ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (vase_at ?x ?y ?t1)
      (not (next_at ?x ?z ?t))
    )
  )

  ;; CLIP
  (:action actor_a_clip
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next_at ?y ?z ?t)
      (next_at ?x ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (vase_at ?x ?y ?t1)
      (not (next_at ?x ?z ?t))
    )
  )

  (:action actor_b_clip
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next_at ?y ?z ?t)
      (next_at ?x ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (vase_at ?x ?y ?t1)
      (not (next_at ?x ?z ?t))
    )
  )

  ;; PALTRY
  (:action actor_a_paltry
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase_at ?x ?y ?t)
      (next_at ?y ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (vase_at ?x ?y ?t))
    )
  )

  (:action actor_b_paltry
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase_at ?x ?y ?t)
      (next_at ?y ?z ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (vase_at ?x ?y ?t))
    )
  )

  ;; TIGHTFISTED
  (:action actor_a_tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next_at ?y ?z ?t)
      (vase_at ?x ?y ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (vase_at ?x ?y ?t))
    )
  )

  (:action actor_b_tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next_at ?y ?z ?t)
      (vase_at ?x ?y ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (vase_at ?x ?y ?t))
    )
  )

  ;; MEMORY
  (:action actor_a_memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next_at ?x ?y ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (next_at ?x ?y ?t))
    )
  )

  (:action actor_b_memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t1 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next_at ?x ?y ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (next_at ?x ?y ?t))
    )
  )

  ;; WRETCHED
  (:action actor_a_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t1 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next_at ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (next_at ?x ?y ?t))
    )
  )

  (:action actor_b_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t1 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next_at ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t1)
    )
    :effect (and
      (next_at ?x ?z ?t1)
      (not (next_at ?x ?y ?t))
    )
  )
)