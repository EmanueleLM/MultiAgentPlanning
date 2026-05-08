(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
  )

  ;; paltry:
  ;; Preconditions: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; Uniqueness constraint for successor of ?h: require that no next(?h, ?) currently holds
  ;; Effects: add next(?h, ?t), remove vase(?h, ?c)
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?old - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (not (next ?h ?old))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip:
  ;; Preconditions: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; Additional grounding precondition: require collect(?t, ?col) so vase production is causally grounded
  ;; Effects: add vase(?h, ?c), remove next(?h, ?t)
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?col - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (collect ?t ?col)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip:
  ;; Preconditions: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; Additional causal grounding: require collect(?t, ?col)
  ;; Effects: add vase(?h, ?s), remove next(?h, ?t)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?col - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      (collect ?t ?col)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched:
  ;; Preconditions: sneeze ?x, texture ?t1, texture ?t2, stupendous ?st, next ?x ?t1, collect ?t1 ?st, collect ?t2 ?st
  ;; Effects: add next ?x ?t2, remove next ?x ?t1
  (:action wretched
    :parameters (?x - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?x ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?x ?t2)
      (not (next ?x ?t1))
    )
  )

  ;; memory:
  ;; Preconditions: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; Effects: add next ?c ?s2, remove next ?c ?s1
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

  ;; tightfisted:
  ;; Preconditions: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; Enforce uniqueness for successor of ?h (no existing next ?h ?old)
  ;; Effects: add next ?h ?t, remove vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?old - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      (not (next ?h ?old))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

)