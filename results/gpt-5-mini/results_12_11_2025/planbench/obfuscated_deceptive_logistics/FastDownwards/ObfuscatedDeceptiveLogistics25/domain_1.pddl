(define (domain ObfuscatedDeceptiveLogistics25)
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
  ;; Preconditions: hand(object_0), cats(object_1), texture(object_2), next(object_0,object_1), next(object_1,object_2)
  ;; Effects: next(object_0,object_2) and delete next(object_0,object_1)
  (:action paltry
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_1)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; sip(object_0 object_1 object_2)
  ;; Preconditions: hand(object_0), cats(object_1), texture(object_2), next(object_0,object_2), next(object_1,object_2)
  ;; Effects: next(object_0,object_1) and delete next(object_0,object_2)
  (:action sip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_2)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ;; clip(object_0 object_1 object_2)
  ;; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), next(object_0,object_2)
  ;; Effects: next(object_0,object_1) and delete next(object_0,object_2)
  (:action clip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (next ?object_0 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ;; wretched(object_0 object_1 object_2 object_3)
  ;; Preconditions: sneeze(object_0), texture(object_1), texture(object_2), stupendous(object_3),
  ;;                next(object_0,object_1), collect(object_1,object_3), collect(object_2,object_3)
  ;; Effects: next(object_0,object_2) and delete next(object_0,object_1)
  (:action wretched
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?object_3 - obj)
    :precondition (and
      (sneeze ?object_0)
      (texture ?object_1)
      (texture ?object_2)
      (stupendous ?object_3)
      (next ?object_0 ?object_1)
      (collect ?object_1 ?object_3)
      (collect ?object_2 ?object_3)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; memory(object_0 object_1 object_2)
  ;; Preconditions: cats(object_0), spring(object_1), spring(object_2), next(object_0,object_1)
  ;; Effects: next(object_0,object_2) and delete next(object_0,object_1)
  (:action memory
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (cats ?object_0)
      (spring ?object_1)
      (spring ?object_2)
      (next ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  ;; tightfisted(object_0 object_1 object_2)
  ;; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), next(object_0,object_1)
  ;; Effects: next(object_0,object_2) and delete next(object_0,object_1)
  (:action tightfisted
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (next ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )
)