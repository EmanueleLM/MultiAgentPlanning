(define (domain orchestrator)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    ;; unary static predicates describing object properties
    (cats ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)

    ;; binary relation predicates manipulated by actions
    (collect ?o - obj ?p - obj)  ;; collect relation (static)
    (next ?a - obj ?b - obj)     ;; mutable relation (goal target)
    (vase ?h - obj ?o - obj)     ;; ephemeral resource produced/consumed
  )

  ;; Action schemas derived from the analyst reports.
  ;; Effects follow the described add/delete behaviour.

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
      (not (next ?o0 ?o1))
      (next ?o0 ?o2)
    )
  )

  (:action clip
    :parameters (?h - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?h ?o2)
    )
    :effect (and
      (vase ?h ?o1)
      (not (next ?h ?o2))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?h ?o1)
    )
    :effect (and
      (next ?h ?o2)
      (not (vase ?h ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (next ?o0 ?o1))
      (next ?o0 ?o2)
    )
  )

  (:action sip
    :parameters (?h - obj ?o0 - obj ?o2 - obj)
    :precondition (and
      (hand ?h)
      (cats ?o0)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?h ?o2)
    )
    :effect (and
      (vase ?h ?o0)
      (not (next ?h ?o2))
    )
  )

  (:action paltry
    :parameters (?h - obj ?o0 - obj ?o2 - obj)
    :precondition (and
      (hand ?h)
      (cats ?o0)
      (texture ?o2)
      (vase ?h ?o0)
      (next ?o0 ?o2)
    )
    :effect (and
      (next ?h ?o2)
      (not (vase ?h ?o0))
    )
  )
)