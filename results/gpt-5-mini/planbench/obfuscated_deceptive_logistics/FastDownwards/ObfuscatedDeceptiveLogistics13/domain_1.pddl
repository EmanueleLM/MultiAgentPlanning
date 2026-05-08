(define (domain obfuscated_deceptive_logistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; paltry(object_h, object_c, object_t)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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

  ;; sip(object_h, object_c, object_t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
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

  ;; clip(object_h, object_sneeze, object_t)
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
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

  ;; wretched(object_sneeze, texture_a, texture_b, stupendous_obj)
  (:action wretched
    :parameters (?s - object ?ta - object ?tb - object ?st - object)
    :precondition (and
      (sneeze ?s)
      (texture ?ta)
      (texture ?tb)
      (stupendous ?st)
      (next ?s ?ta)
      (collect ?ta ?st)
      (collect ?tb ?st)
    )
    :effect (and
      (next ?s ?tb)
      (not (next ?s ?ta))
    )
  )

  ;; memory(object_cats, spring_a, spring_b)
  (:action memory
    :parameters (?c - object ?sa - object ?sb - object)
    :precondition (and
      (cats ?c)
      (spring ?sa)
      (spring ?sb)
      (next ?c ?sa)
    )
    :effect (and
      (next ?c ?sb)
      (not (next ?c ?sa))
    )
  )

  ;; tightfisted(object_h, object_sneeze, object_t)
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
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