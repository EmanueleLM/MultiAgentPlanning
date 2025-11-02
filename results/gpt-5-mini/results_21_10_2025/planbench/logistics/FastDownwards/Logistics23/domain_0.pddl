(define (domain orchestrated-domain)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (cats ?o)
    (collect ?o1 ?o2)
    (hand ?o)
    (next ?o1 ?o2)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
    (texture ?o)
    (vase ?o1 ?o2)
  )

  ;; Actions belonging to player_b (suffix _pb) and player_a (suffix _pa).
  ;; paltry and sip and memory from player_b are represented with minimal
  ;; preconditions reflecting what the agent can guarantee. They are no-ops
  ;; wrt effects because no effect details were provided by the agents.
  (:action paltry_pb
    :parameters (?x)
    :precondition (and
      (cats ?x)
    )
    :effect (and
      ;; no state-changing effects encoded (agent provided only capability)
    )
  )

  (:action sip_pb
    :parameters (?x)
    :precondition (and
      (cats ?x)
    )
    :effect (and
      ;; no state-changing effects encoded
    )
  )

  (:action memory_pb
    :parameters (?x)
    :precondition (and
      (cats ?x)
    )
    :effect (and
      ;; no state-changing effects encoded
    )
  )

  ;; Actions from player_a whose preconditions/effects are explicitly given
  ;; in the supplied plan summaries.
  (:action clip_pa
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched_pa
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action tightfisted_pa
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)