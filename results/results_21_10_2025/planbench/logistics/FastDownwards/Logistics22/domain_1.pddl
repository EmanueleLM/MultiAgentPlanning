(define (domain Logistics22)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  ;; Predicates
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
  )

  ;; Actions

  ;; paltry object_0 object_1 object_2.
  ;; pre: hand object_0, cats object_1, texture object_2, vase object_0 object_1, next object_1 object_2
  ;; add: next object_0 object_2
  ;; del: vase object_0 object_1
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

  ;; sip object_0 object_1 object_2.
  ;; pre: hand object_0, cats object_1, texture object_2, next object_0 object_2, next object_1 object_2
  ;; add: vase object_0 object_1
  ;; del: next object_0 object_2
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

  ;; clip object_0 object_1 object_2.
  ;; pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, next object_0 object_2
  ;; add: vase object_0 object_1
  ;; del: next object_0 object_2
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

  ;; wretched object_0 object_1 object_2 object_3.
  ;; pre: sneeze object_0, texture object_1, texture object_2, stupendous object_3,
  ;;      next object_0 object_1, collect object_1 object_3, collect object_2 object_3
  ;; add: next object_0 object_2
  ;; del: next object_0 object_1
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

  ;; memory object_0 object_1 object_2.
  ;; pre: cats object_0, spring object_1, spring object_2, next object_0 object_1
  ;; add: next object_0 object_2
  ;; del: next object_0 object_1
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

  ;; tightfisted object_0 object_1 object_2.
  ;; pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, vase object_0 object_1
  ;; add: next object_0 object_2
  ;; del: vase object_0 object_1
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

)