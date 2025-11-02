(define (domain multiagent-unified)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o)
    (next ?a ?b)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
    (collect ?o1 ?o2)
  )

  ;; Actions originating from Analyst_A (scenario 1)
  (:action wretched_A
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (texture ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action clip_A
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (sneeze ?old) (texture ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action tightfisted_A
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (spring ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action sip_A
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (cats ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action memory_A
    :parameters (?h ?old ?new ?c)
    :precondition (and (hand ?h) (next ?h ?old) (collect ?new ?c))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action paltry_A
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (stupendous ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  ;; Actions originating from Analyst_B (scenario 2)
  (:action wretched_B
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (texture ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action clip_B
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (sneeze ?old) (texture ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action tightfisted_B
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (spring ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action sip_B
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (cats ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action memory_B
    :parameters (?h ?old ?new ?c)
    :precondition (and (hand ?h) (next ?h ?old) (collect ?new ?c))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )

  (:action paltry_B
    :parameters (?h ?old ?new)
    :precondition (and (hand ?h) (next ?h ?old) (stupendous ?new))
    :effect (and (not (next ?h ?old)) (next ?h ?new))
  )
)