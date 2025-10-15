(define (domain objects-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; paltry OBJ0 OBJ1 OBJ2
  ;; preconditions: hand OBJ0, cats OBJ1, texture OBJ2, vase OBJ0 OBJ1, next OBJ1 OBJ2
  ;; effects: add next OBJ0 OBJ2, del vase OBJ0 OBJ1
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

  ;; sip OBJ0 OBJ1 OBJ2
  ;; preconditions: hand OBJ0, cats OBJ1, texture OBJ2, next OBJ0 OBJ2, next OBJ1 OBJ2
  ;; effects: add vase OBJ0 OBJ1, del next OBJ0 OBJ2
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

  ;; clip OBJ0 OBJ1 OBJ2
  ;; preconditions: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, next OBJ0 OBJ2
  ;; effects: add vase OBJ0 OBJ1, del next OBJ0 OBJ2
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

  ;; wretched OBJ0 OBJ1 OBJ2 OBJ3
  ;; preconditions: sneeze OBJ0, texture OBJ1, texture OBJ2, stupendous OBJ3,
  ;;                next OBJ0 OBJ1, collect OBJ1 OBJ3, collect OBJ2 OBJ3
  ;; effects: add next OBJ0 OBJ2, del next OBJ0 OBJ1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
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

  ;; memory OBJ0 OBJ1 OBJ2
  ;; preconditions: cats OBJ0, spring OBJ1, spring OBJ2, next OBJ0 OBJ1
  ;; effects: add next OBJ0 OBJ2, del next OBJ0 OBJ1
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

  ;; tightfisted OBJ0 OBJ1 OBJ2
  ;; preconditions: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, vase OBJ0 OBJ1
  ;; effects: add next OBJ0 OBJ2, del vase OBJ0 OBJ1
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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