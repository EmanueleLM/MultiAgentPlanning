(define (domain ObfuscatedDeceptiveLogistics29)
  ; Requirements: use STRIPS-style actions and allow negative preconditions if needed.
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o0 ?o1)
    (next ?o0 ?o1)
    (sneeze ?o)
    (collect ?o0 ?o1)
    (spring ?o)
    (stupendous ?o)
  )

  ; Agent-prefixed actions per analyst schemas (prefix "analyst_" to mark origin)
  (:action analyst_paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action analyst_sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action analyst_clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action analyst_wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action analyst_memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action analyst_tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)