(define (domain orchestrator)
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

  ;; paltry requires hand obj0, cats obj1, texture obj2, vase obj0 obj1, next obj1 obj2;
  ;; effects: next obj0 obj2, not(vase obj0 obj1)
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

  ;; sip requires hand obj0, cats obj1, texture obj2, next obj0 obj2, next obj1 obj2;
  ;; effects: vase obj0 obj1, not(next obj0 obj2)
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

  ;; clip requires hand obj0, sneeze obj1, texture obj2, next obj1 obj2, next obj0 obj2;
  ;; effects: vase obj0 obj1, not(next obj0 obj2)
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

  ;; wretched requires sneeze obj0, texture obj1, texture obj2, stupendous obj3, next obj0 obj1, collect obj1 obj3, collect obj2 obj3;
  ;; effects: next obj0 obj2, not(next obj0 obj1)
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?stp - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?s ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory requires cats obj0, spring obj1, spring obj2, next obj0 obj1;
  ;; effects: next obj0 obj2, not(next obj0 obj1)
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

  ;; tightfisted requires hand obj0, sneeze obj1, texture obj2, next obj1 obj2, vase obj0 obj1;
  ;; effects: next obj0 obj2, not(vase obj0 obj1)
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