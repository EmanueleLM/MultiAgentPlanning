(define (domain multiagent-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates (public schema predicates)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; ACTION SCHEMAS as published. Distinct agent-intended actors are reflected
  ;; by action name prefixes actor_a_ and actor_b_. Preconditions and effects
  ;; are fully explicit and match the public schemas cited in the audit.

  ;; SIP (produces vase, consumes a specific next)
  (:action actor_a_sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action actor_b_sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; CLIP (similar to sip but uses sneeze instead of cats)
  (:action actor_a_clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action actor_b_clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; PALTRY (consumes a vase and an existing next, produces a next)
  (:action actor_a_paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  (:action actor_b_paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; TIGHTFISTED (like paltry but requires sneeze on the middle object)
  (:action actor_a_tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  (:action actor_b_tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; MEMORY (re-targets an existing next from subject ?x: next ?x ?y -> next ?x ?z)
  (:action actor_a_memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action actor_b_memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; WRETCHED (alternative re-targeting with richer material preconditions)
  (:action actor_a_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y)
      (collect ?y ?c)
      (collect ?z ?c)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action actor_b_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y)
      (collect ?y ?c)
      (collect ?z ?c)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

)