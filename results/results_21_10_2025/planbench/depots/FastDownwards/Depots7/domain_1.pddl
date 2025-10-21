(define (domain multi_fragment_domain)
  (:requirements :strips :negative-preconditions :typing)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; clip(h sn t)
  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
    )
  )

  ;; wretched(sn t1 t2 s)
  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?s - obj)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?s)
      (next ?sn ?t1)
      (collect ?t1 ?s)
      (collect ?t2 ?s)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
    )
  )

  ;; tightfisted(h sn t)
  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
    )
  )

  ;; sip(h c t)
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

  ;; memory(c s1 s2)
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

  ;; paltry(h c t)
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
)