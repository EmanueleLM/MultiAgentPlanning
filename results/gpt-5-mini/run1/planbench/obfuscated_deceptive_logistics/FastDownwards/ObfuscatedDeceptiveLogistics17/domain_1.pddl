(define (domain obfuscated_deceptive_logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

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

  ;; paltry: hand H, cats C, texture T, vase H C, next C T -> add next H T, del vase H C
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

  ;; sip: hand H, cats C, texture T, next H T, next C T -> add vase H C, del next H T
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

  ;; clip: hand H, sneeze S, texture T, next S T, next H T -> add vase H S, del next H T
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

  ;; wretched: sneeze S0, texture T1, texture T2, stupendous ST, next S0 T1, collect T1 ST, collect T2 ST
  ;; -> add next S0 T2, del next S0 T1
  (:action wretched
    :parameters (?s0 - object ?t1 - object ?t2 - object ?st - object)
    :precondition (and
      (sneeze ?s0)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s0 ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s0 ?t2)
      (not (next ?s0 ?t1))
    )
  )

  ;; memory: cats C, spring S1, spring S2, next C S1 -> add next C S2, del next C S1
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
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

  ;; tightfisted: hand H, sneeze S, texture T, next S T, vase H S -> add next H T, del vase H S
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