(define (domain ObfuscatedDeceptiveLogistics16)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o ?p)
    (next ?o ?p)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?o ?p)
    (spring ?o)
  )

  ;; paltry: parameters (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; add: next ?h ?t
  ;; del: vase ?h ?c
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

  ;; sip: parameters (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; add: vase ?h ?c
  ;; del: next ?h ?t
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

  ;; clip: parameters (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; add: vase ?h ?s
  ;; del: next ?h ?t
  (:action clip
    :parameters (?h ?s ?t)
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

  ;; wretched: parameters (?s ?t1 ?t2 ?st)
  ;; pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?st, next ?s ?t1, collect ?t1 ?st, collect ?t2 ?st
  ;; add: next ?s ?t2
  ;; del: next ?s ?t1
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory: parameters (?c ?sp1 ?sp2)
  ;; pre: cats ?c, spring ?sp1, spring ?sp2, next ?c ?sp1
  ;; add: next ?c ?sp2
  ;; del: next ?c ?sp1
  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  ;; tightfisted: parameters (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; add: next ?h ?t
  ;; del: vase ?h ?s
  (:action tightfisted
    :parameters (?h ?s ?t)
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