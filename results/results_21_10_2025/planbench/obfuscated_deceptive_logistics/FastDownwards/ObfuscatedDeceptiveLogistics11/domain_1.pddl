(define (domain ObfuscatedDeceptiveLogistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
  )

  ;; paltry: params (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; add: next ?h ?t
  ;; del: vase ?h ?c
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

  ;; sip: params (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; add: vase ?h ?c
  ;; del: next ?h ?t
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

  ;; clip: params (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; add: vase ?h ?s
  ;; del: next ?h ?t
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

  ;; wretched: params (?sneeze ?t1 ?t2 ?stup)
  ;; pre: sneeze ?sneeze, texture ?t1, texture ?t2, stupendous ?stup,
  ;;      next ?sneeze ?t1, collect ?t1 ?stup, collect ?t2 ?stup
  ;; add: next ?sneeze ?t2
  ;; del: next ?sneeze ?t1
  (:action wretched
    :parameters (?sneeze - object ?t1 - object ?t2 - object ?stup - object)
    :precondition (and
      (sneeze ?sneeze)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stup)
      (next ?sneeze ?t1)
      (collect ?t1 ?stup)
      (collect ?t2 ?stup)
    )
    :effect (and
      (next ?sneeze ?t2)
      (not (next ?sneeze ?t1))
    )
  )

  ;; memory: params (?c ?s1 ?s2)
  ;; pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; add: next ?c ?s2
  ;; del: next ?c ?s1
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

  ;; tightfisted: params (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; add: next ?h ?t
  ;; del: vase ?h ?s
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