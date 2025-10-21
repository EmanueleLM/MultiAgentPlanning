(define (domain MysteryBlocksworld26)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
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

  ;; wretched: params (?o0 ?o1 ?o2 ?o3)
  ;; pre: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3,
  ;;      next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; add: next ?o0 ?o2
  ;; del: next ?o0 ?o1
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
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