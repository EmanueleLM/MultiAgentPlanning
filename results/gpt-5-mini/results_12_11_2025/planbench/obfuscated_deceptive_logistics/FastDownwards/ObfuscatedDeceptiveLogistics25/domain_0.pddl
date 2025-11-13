(define (domain orchestrator_normalized)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
  )

  ;; paltry(object_0 object_1 object_2)
  ;; Normalized: moves next(object_0,object_1) -> next(object_0,object_2)
  (:action paltry
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_1)    ;; require current pointer from subject to 'link'
      (next ?object_1 ?object_2)    ;; require link -> target
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; sip(object_0 object_1 object_2)
  ;; Normalized: swaps next(object_0,object_2) -> next(object_0,object_1)
  (:action sip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_2)    ;; require subject currently pointing to target
      (next ?object_1 ?object_2)    ;; require link (cats) also points to that target
    )
    :effect (and
      (next ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ;; clip(object_0 object_1 object_2)
  ;; Normalized: swap next(object_0,object_2) -> next(object_0,object_1) where object_1 is a sneeze
  (:action clip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)    ;; sneeze -> texture
      (next ?object_0 ?object_2)    ;; subject -> same texture
    )
    :effect (and
      (next ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ;; wretched(object_0 object_1 object_2 object_3)
  ;; Normalized: moves next(object_0,object_1) -> next(object_0,object_2), requiring collect-group coherence
  (:action wretched
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?object_3 - obj)
    :precondition (and
      (sneeze ?object_0)
      (texture ?object_1)
      (texture ?object_2)
      (stupendous ?object_3)
      (next ?object_0 ?object_1)        ;; require current pointer subject->from
      (collect ?object_1 ?object_3)     ;; both from and to must collect to same collector
      (collect ?object_2 ?object_3)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; memory(object_0 object_1 object_2)
  ;; Normalized: moves next(object_0,object_1) -> next(object_0,object_2) where both are springs
  (:action memory
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (cats ?object_0)
      (spring ?object_1)
      (spring ?object_2)
      (next ?object_0 ?object_1)    ;; require current pointer cats->from
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; tightfisted(object_0 object_1 object_2)
  ;; Normalized: moves next(object_0,object_1) -> next(object_0,object_2) where object_1 is a sneeze
  (:action tightfisted
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)    ;; sneeze -> texture
      (next ?object_0 ?object_1)    ;; subject -> sneeze
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )
)