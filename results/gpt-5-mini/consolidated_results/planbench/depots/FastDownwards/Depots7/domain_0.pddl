(define (domain multi_fragment_domain)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (collect ?x ?y)
    (spring ?x)
    (stupendous ?x)
  )

  ;; clip(h sn t)
  (:action clip
    :parameters (?h ?sn ?t)
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
    :parameters (?sn ?t1 ?t2 ?s)
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
    :parameters (?h ?sn ?t)
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
    :parameters (?h ?c ?t)
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
    :parameters (?c ?s1 ?s2)
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
    :parameters (?h ?c ?t)
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