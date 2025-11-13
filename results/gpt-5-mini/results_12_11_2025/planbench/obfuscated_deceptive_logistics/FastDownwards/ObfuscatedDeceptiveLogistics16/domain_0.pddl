(define (domain orchestrated-multiagent)
  (:requirements :strips :typing)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj)
    (at-stage ?s - stage)
  )

  ;; Actions observed and reconciled from planner_alpha (prefix: alpha-)
  ;; Each action enforces explicit stage progression so the observed plan order cannot be reordered.
  (:action alpha-paltry
    :parameters (?x - obj)
    :precondition (and (hand ?x) (at-stage s0))
    :effect (and
      (not (hand ?x))
      (collect ?x)
      (not (at-stage s0))
      (at-stage s1)
    )
  )

  (:action alpha-clip
    :parameters (?origin - obj ?neighbor - obj ?new - obj)
    :precondition (and (next ?origin ?neighbor) (texture ?neighbor) (at-stage s1))
    :effect (and
      (not (next ?origin ?neighbor))
      (next ?origin ?new)
      (not (at-stage s1))
      (at-stage s2)
    )
  )

  (:action alpha-sip
    :parameters (?cup - obj)
    :precondition (and (vase ?cup) (at-stage s2))
    :effect (and
      (not (vase ?cup))
      (sneeze ?cup)
      (not (at-stage s2))
      (at-stage s3)
    )
  )

  (:action alpha-memory
    :parameters (?subject - obj ?object - obj)
    :precondition (and (cats ?subject) (texture ?object) (at-stage s3))
    :effect (and
      (not (texture ?object))
      (stupendous ?object)
      (not (at-stage s3))
      (at-stage s4)
    )
  )

  (:action alpha-tightfisted
    :parameters (?item - obj)
    :precondition (and (collect ?item) (at-stage s4))
    :effect (and
      (not (collect ?item))
      (spring ?item)
      (not (at-stage s4))
      (at-stage s5)
    )
  )

  ;; The original planner_alpha observation for wretched contained an ambiguous sneeze binding.
  ;; Auditor reconciliation: require that a sneeze has happened on object_2 (the observed sip produced sneeze(object_2)),
  ;; so wretched's precondition references that concrete fact to remove bookkeeping ambiguity.
  (:action alpha-wretched
    :parameters (?entity - obj)
    :precondition (and (sneeze object_2) (at-stage s5))
    :effect (and
      (next ?entity object_1)
      (not (at-stage s5))
      (at-stage s6)
    )
  )

  ;; Duplicate action schemas attributed to planner_beta (prefix: beta-) to reflect agent responsibility.
  ;; Semantics are reconciled to match the integrated global model (same preconditions/effects as alpha- variants).
  (:action beta-paltry
    :parameters (?x - obj)
    :precondition (and (hand ?x) (at-stage s0))
    :effect (and
      (not (hand ?x))
      (collect ?x)
      (not (at-stage s0))
      (at-stage s1)
    )
  )

  (:action beta-clip
    :parameters (?origin - obj ?neighbor - obj ?new - obj)
    :precondition (and (next ?origin ?neighbor) (texture ?neighbor) (at-stage s1))
    :effect (and
      (not (next ?origin ?neighbor))
      (next ?origin ?new)
      (not (at-stage s1))
      (at-stage s2)
    )
  )

  (:action beta-sip
    :parameters (?cup - obj)
    :precondition (and (vase ?cup) (at-stage s2))
    :effect (and
      (not (vase ?cup))
      (sneeze ?cup)
      (not (at-stage s2))
      (at-stage s3)
    )
  )

  (:action beta-memory
    :parameters (?subject - obj ?object - obj)
    :precondition (and (cats ?subject) (texture ?object) (at-stage s3))
    :effect (and
      (not (texture ?object))
      (stupendous ?object)
      (not (at-stage s3))
      (at-stage s4)
    )
  )

  (:action beta-tightfisted
    :parameters (?item - obj)
    :precondition (and (collect ?item) (at-stage s4))
    :effect (and
      (not (collect ?item))
      (spring ?item)
      (not (at-stage s4))
      (at-stage s5)
    )
  )

  (:action beta-wretched
    :parameters (?entity - obj)
    :precondition (and (sneeze object_2) (at-stage s5))
    :effect (and
      (next ?entity object_1)
      (not (at-stage s5))
      (at-stage s6)
    )
  )
)