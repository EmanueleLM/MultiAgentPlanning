(define (domain multi_agent_domain)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (collect ?x ?y)
  )

  ;; paltry ?x ?y ?z
  ;; Preconditions: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; Effects: add next ?x ?z, delete vase ?x ?y
  (:action paltry
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip ?x ?y ?z
  ;; Preconditions: hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; Effects: add vase ?x ?y, delete next ?x ?z
  (:action sip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip ?x ?y ?z
  ;; Preconditions: hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; Effects: add vase ?x ?y, delete next ?x ?z
  (:action clip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched ?x ?y ?z ?u
  ;; Preconditions: sneeze ?x, texture ?y, texture ?z, stupendous ?u, next ?x ?y, collect ?y ?u, collect ?z ?u
  ;; Effects: add next ?x ?z, delete next ?x ?y
  (:action wretched
    :parameters (?x ?y ?z ?u)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?u) (next ?x ?y) (collect ?y ?u) (collect ?z ?u))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; memory ?x ?y ?z
  ;; Preconditions: cats ?x, spring ?y, spring ?z, next ?x ?y
  ;; Effects: add next ?x ?z, delete next ?x ?y
  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; tightfisted ?x ?y ?z
  ;; Preconditions: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; Effects: add next ?x ?z, delete vase ?x ?y
  (:action tightfisted
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)