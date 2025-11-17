(define (domain object-relations)
  ; Domain created from the agent analyses. Types and predicates mirror the provided predicate names.
  ; Note: The analyses did not supply any concrete initial-state facts or explicit goals. The problem file
  ; included separately lists objects only; initial facts and goals are set there. No semantic typing beyond
  ; the single type 'obj' is assumed because the original inputs did not define separate types.
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    (collect ?a - obj ?b - obj)
  )

  ; Action paltry(object_0, object_1, object_2)
  ; Preconditions:
  ;   hand(object_0), cats(object_1), texture(object_2), vase(object_0,object_1), next(object_1,object_2)
  ; Effects: add next(object_0,object_2), delete vase(object_0,object_1)
  (:action paltry
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (vase ?object_0 ?object_1)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )

  ; Action sip(object_0, object_1, object_2)
  ; Preconditions:
  ;   hand(object_0), cats(object_1), texture(object_2), next(object_0,object_2), next(object_1,object_2)
  ; Effects: add vase(object_0,object_1), delete next(object_0,object_2)
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
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ; Action clip(object_0, object_1, object_2)
  ; Preconditions:
  ;   hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), next(object_0,object_2)
  ; Effects: add vase(object_0,object_1), delete next(object_0,object_2)
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
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  ; Action wretched(object_0, object_1, object_2, object_3)
  ; Preconditions:
  ;   sneeze(object_0), texture(object_1), texture(object_2), stupendous(object_3),
  ;   next(object_0,object_1), collect(object_1,object_3), collect(object_2,object_3)
  ; Effects: add next(object_0,object_2), delete next(object_0,object_1)
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

  ; Action memory(object_0, object_1, object_2)
  ; Preconditions:
  ;   cats(object_0), spring(object_1), spring(object_2), next(object_0,object_1)
  ; Effects: add next(object_0,object_2), delete next(object_0,object_1)
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

  ; Action tightfisted(object_0, object_1, object_2)
  ; Preconditions:
  ;   hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), vase(object_0,object_1)
  ; Effects: add next(object_0,object_2), delete vase(object_0,object_1)
  (:action tightfisted
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (vase ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )

)