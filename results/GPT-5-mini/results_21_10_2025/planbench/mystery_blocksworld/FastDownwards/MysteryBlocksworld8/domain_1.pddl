(define (domain MysteryBlocksworld8-domain)
  ; Requirements: STRIPS style, typing, and negative preconditions compatible with Fast Downward.
  (:requirements :strips :typing :negative-preconditions)

  ; Types
  (:types object)

  ; Predicates (ground facts over objects)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ; ---------------------------------------------------------------------
  ; ACTIONS (formalized exactly from the public action descriptions in the specification)
  ; Variable naming: actions use positional parameters corresponding to object_0, object_1, ...
  ; Each action uses only add and delete effects (STRIPS). Negative preconditions are allowed.
  ; ---------------------------------------------------------------------

  ; Action: paltry object_0 object_1 object_2.
  ; Preconditions: hand object_0, cats object_1, texture object_2, vase object_0 object_1, next object_1 object_2
  ; Effects: add next object_0 object_2, remove vase object_0 object_1
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: sip object_0 object_1 object_2.
  ; Preconditions: hand object_0, cats object_1, texture object_2, next object_0 object_2, next object_1 object_2
  ; Effects: add vase object_0 object_1, remove next object_0 object_2
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: clip object_0 object_1 object_2.
  ; Preconditions: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, next object_0 object_2
  ; Effects: add vase object_0 object_1, remove next object_0 object_2
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: wretched object_0 object_1 object_2 object_3.
  ; Preconditions: sneeze object_0, texture object_1, texture object_2, stupendous object_3,
  ;                next object_0 object_1, collect object_1 object_3, collect object_2 object_3
  ; Effects: add next object_0 object_2, remove next object_0 object_1
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
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

  ; Action: memory object_0 object_1 object_2.
  ; Preconditions: cats object_0, spring object_1, spring object_2, next object_0 object_1
  ; Effects: add next object_0 object_2, remove next object_0 object_1
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: tightfisted object_0 object_1 object_2.
  ; Preconditions: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, vase object_0 object_1
  ; Effects: add next object_0 object_2, remove vase object_0 object_1
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; End of domain
  ; NOTE: The domain encodes the exact preconditions and effects as provided in the specification.
  ;       Variable roles were kept positional to match the human descriptions (object_0, object_1, ...).
)