(define (domain Logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    ;; occupancy marker: object currently has exactly one "next" target (maintained by actions)
    (has-next ?o - obj)
  )

  ;; paltry:
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t, ?c must already have a next, ?h must not already have a next
  ;; add: next ?h ?t, has-next ?h
  ;; del: vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (has-next ?c)
      (not (has-next ?h))
    )
    :effect (and
      (next ?h ?t)
      (has-next ?h)
      (not (vase ?h ?c))
    )
  )

  ;; sip:
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t, both must have has-next
  ;; add: vase ?h ?c
  ;; del: next ?h ?t, has-next ?h
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (has-next ?h)
      (has-next ?c)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (has-next ?h))
    )
  )

  ;; clip:
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t, both have has-next
  ;; add: vase ?h ?s
  ;; del: next ?h ?t, has-next ?h
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      (has-next ?s)
      (has-next ?h)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
      (not (has-next ?h))
    )
  )

  ;; wretched:
  ;; pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?st, next ?s ?t1, collect ?t1 ?st, collect ?t2 ?st, and ?s must have has-next
  ;; add: next ?s ?t2
  ;; del: next ?s ?t1
  ;; (has-next for ?s remains true because it moves its target)
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (has-next ?s)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory:
  ;; pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1, and ?c must have has-next
  ;; add: next ?c ?s2
  ;; del: next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (has-next ?c)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted:
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s, ?s must have has-next, ?h must not have has-next
  ;; add: next ?h ?t, has-next ?h
  ;; del: vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (has-next ?s)
      (vase ?h ?s)
      (not (has-next ?h))
    )
    :effect (and
      (next ?h ?t)
      (has-next ?h)
      (not (vase ?h ?s))
    )
  )
)