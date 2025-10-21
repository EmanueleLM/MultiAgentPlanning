(define (domain ObfuscatedDeceptiveLogistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?h - obj ?s - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  ;; paltry: preconditions: hand h, cats c, texture t, vase h c, next c t
  ;; effects: add next h t, delete vase h c
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
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ;; sip: preconditions: hand h, cats c, texture t, next h t, next c t
  ;; effects: add vase h c, delete next h t
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
      (not (next ?h ?t))
      (vase ?h ?c)
    )
  )

  ;; clip: preconditions: hand h, sneeze s, texture t, next s t, next h t
  ;; effects: add vase h s, delete next h t
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
      (not (next ?h ?t))
      (vase ?h ?s)
    )
  )

  ;; wretched: preconditions: sneeze s, texture from, texture to, stupendous st,
  ;;               next s from, collect from st, collect to st
  ;; effects: add next s to, delete next s from
  (:action wretched
    :parameters (?s - obj ?from - obj ?to - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?st)
      (next ?s ?from)
      (collect ?from ?st)
      (collect ?to ?st)
    )
    :effect (and
      (not (next ?s ?from))
      (next ?s ?to)
    )
  )

  ;; memory: preconditions: cats c, spring from, spring to, next c from
  ;; effects: add next c to, delete next c from
  (:action memory
    :parameters (?c - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (not (next ?c ?from))
      (next ?c ?to)
    )
  )

  ;; tightfisted: preconditions: hand h, sneeze s, texture t, next s t, vase h s
  ;; effects: add next h t, delete vase h s
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
      (not (vase ?h ?s))
      (next ?h ?t)
    )
  )
)