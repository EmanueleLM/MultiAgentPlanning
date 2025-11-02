(define (domain adjacency-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (collect ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Action: paltry(OBJ0, OBJ1, OBJ2)
  ;; Preconditions: hand OBJ0, cats OBJ1, texture OBJ2, vase OBJ0 OBJ1, next OBJ1 OBJ2
  ;; Effects: add next OBJ0 OBJ2, delete vase OBJ0 OBJ1
  (:action paltry
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
    :precondition (and
      (hand ?obj0)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?obj0 ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (vase ?obj0 ?obj1))
    )
  )

  ;; Action: sip(OBJ0, OBJ1, OBJ2)
  ;; Preconditions: hand OBJ0, cats OBJ1, texture OBJ2, next OBJ0 OBJ2, next OBJ1 OBJ2
  ;; Effects: add vase OBJ0 OBJ1, delete next OBJ0 OBJ2
  (:action sip
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
    :precondition (and
      (hand ?obj0)
      (cats ?obj1)
      (texture ?obj2)
      (next ?obj0 ?obj2)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?obj0 ?obj1)
      (not (next ?obj0 ?obj2))
    )
  )

  ;; Action: clip(OBJ0, OBJ1, OBJ2)
  ;; Preconditions: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, next OBJ0 OBJ2
  ;; Effects: add vase OBJ0 OBJ1, delete next OBJ0 OBJ2
  (:action clip
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
    :precondition (and
      (hand ?obj0)
      (sneeze ?obj1)
      (texture ?obj2)
      (next ?obj1 ?obj2)
      (next ?obj0 ?obj2)
    )
    :effect (and
      (vase ?obj0 ?obj1)
      (not (next ?obj0 ?obj2))
    )
  )

  ;; Action: wretched(OBJ0, OBJ1, OBJ2, OBJ3)
  ;; Preconditions: sneeze OBJ0, texture OBJ1, texture OBJ2, stupendous OBJ3,
  ;;                next OBJ0 OBJ1, collect OBJ1 OBJ3, collect OBJ2 OBJ3
  ;; Effects: add next OBJ0 OBJ2, delete next OBJ0 OBJ1
  (:action wretched
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj ?obj3 - obj)
    :precondition (and
      (sneeze ?obj0)
      (texture ?obj1)
      (texture ?obj2)
      (stupendous ?obj3)
      (next ?obj0 ?obj1)
      (collect ?obj1 ?obj3)
      (collect ?obj2 ?obj3)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (next ?obj0 ?obj1))
    )
  )

  ;; Action: memory(OBJ0, OBJ1, OBJ2)
  ;; Preconditions: cats OBJ0, spring OBJ1, spring OBJ2, next OBJ0 OBJ1
  ;; Effects: add next OBJ0 OBJ2, delete next OBJ0 OBJ1
  (:action memory
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
    :precondition (and
      (cats ?obj0)
      (spring ?obj1)
      (spring ?obj2)
      (next ?obj0 ?obj1)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (next ?obj0 ?obj1))
    )
  )

  ;; Action: tightfisted(OBJ0, OBJ1, OBJ2)
  ;; Preconditions: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, vase OBJ0 OBJ1
  ;; Effects: add next OBJ0 OBJ2, delete vase OBJ0 OBJ1
  (:action tightfisted
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
    :precondition (and
      (hand ?obj0)
      (sneeze ?obj1)
      (texture ?obj2)
      (next ?obj1 ?obj2)
      (vase ?obj0 ?obj1)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (vase ?obj0 ?obj1))
    )
  )
)