(define (domain Logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

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

    ;; explicit stage / time progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ;; structural invariant: subject has no outgoing 'next'
    (no-next ?o - obj)
  )

  ;; paltry: creates a next relation for a subject that currently has no outgoing next
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?stn)
      (no-next ?h)                ;; enforce unique outgoing next for ?h
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (no-next ?h))          ;; now has an outgoing next
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; sip: consumes an existing next for ?h, produces a vase and leaves ?h with no outgoing next
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (no-next ?h)                ;; removed outgoing next for ?h
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; clip: similar to sip, consumes a next for ?h, produces a vase, leaves ?h free (no-next)
  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
      (no-next ?h)
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; wretched: moves the outgoing next of ?s from ?t1 to ?t2 (must have previous next), preserves uniqueness
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?stup - obj ?st - stage ?stn - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stup)
      (next ?s ?t1)
      (collect ?t1 ?stup)
      (collect ?t2 ?stup)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      (not (no-next ?s))          ;; ends up with an outgoing next
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; memory: moves outgoing next of a cats subject from s1 to s2 (must have previous next)
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (no-next ?c))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; tightfisted: requires subject to have no outgoing next, produces a next and removes a vase
  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (current ?st)
      (succ ?st ?stn)
      (no-next ?h)               ;; ensure unique outgoing next
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneeze))
      (not (no-next ?h))
      (not (current ?st))
      (current ?stn)
    )
  )
)