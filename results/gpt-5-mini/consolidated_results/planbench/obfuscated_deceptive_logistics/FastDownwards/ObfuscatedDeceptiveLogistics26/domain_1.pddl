(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)
  )

  ;; paltry object_0 object_1 object_2.
  ;; Pre: hand object_0, cats object_1, texture object_2, vase object_0 object_1, next object_1 object_2
  ;; Add: next object_0 object_2
  ;; Del: vase object_0 object_1
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip object_0 object_1 object_2.
  ;; Pre: hand object_0, cats object_1, texture object_2, next object_0 object_2, next object_1 object_2
  ;; Add: vase object_0 object_1
  ;; Del: next object_0 object_2
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip object_0 object_1 object_2.
  ;; Pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, next object_0 object_2
  ;; Add: vase object_0 object_1
  ;; Del: next object_0 object_2
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched object_0 object_1 object_2 object_3.
  ;; Pre: sneeze object_0, texture object_1, texture object_2, stupendous object_3,
  ;;      next object_0 object_1, collect object_1 object_3, collect object_2 object_3
  ;; Add: next object_0 object_2
  ;; Del: next object_0 object_1
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory object_0 object_1 object_2.
  ;; Pre: cats object_0, spring object_1, spring object_2, next object_0 object_1
  ;; Add: next object_0 object_2
  ;; Del: next object_0 object_1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted object_0 object_1 object_2.
  ;; Pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, vase object_0 object_1
  ;; Add: next object_0 object_2
  ;; Del: vase object_0 object_1
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)