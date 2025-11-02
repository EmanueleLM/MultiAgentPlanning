(define (domain logistics1-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o - object ?p - object)
    (next ?o - object ?p - object)
    (collect ?o - object ?p - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; paltry object_0 object_1 object_2.
  ;; Preconditions: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;; Effects: add next o0 o2, delete vase o0 o1
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
  ;; Preconditions: hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;; Effects: add vase o0 o1, delete next o0 o2
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
  ;; Preconditions: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;; Effects: add vase o0 o1, delete next o0 o2
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
  ;; Preconditions: sneeze o0, texture o1, texture o2, stupendous o3,
  ;;                next o0 o1, collect o1 o3, collect o2 o3
  ;; Effects: add next o0 o2, delete next o0 o1
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
  ;; Preconditions: cats o0, spring o1, spring o2, next o0 o1
  ;; Effects: add next o0 o2, delete next o0 o1
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
  ;; Preconditions: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;; Effects: add next o0 o2, delete vase o0 o1
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