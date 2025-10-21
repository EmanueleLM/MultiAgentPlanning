(define (domain ObfuscatedDeceptiveLogistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (collect ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; paltry action
  ;; Preconditions: hand O0, cats O1, texture O2, vase O0 O1, next O1 O2
  ;; Effects: add next O0 O2, delete vase O0 O1
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

  ;; sip action
  ;; Preconditions: hand O0, cats O1, texture O2, next O0 O2, next O1 O2
  ;; Effects: add vase O0 O1, delete next O0 O2
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

  ;; clip action
  ;; Preconditions: hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2
  ;; Effects: add vase O0 O1, delete next O0 O2
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

  ;; wretched action
  ;; Preconditions: sneeze O0, texture O1, texture O2, stupendous O3, next O0 O1, collect O1 O3, collect O2 O3
  ;; Effects: add next O0 O2, delete next O0 O1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
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

  ;; memory action
  ;; Preconditions: cats O0, spring O1, spring O2, next O0 O1
  ;; Effects: add next O0 O2, delete next O0 O1
  (:action memory
    :parameters (?c - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (next ?c ?to)
      (not (next ?c ?from))
    )
  )

  ;; tightfisted action
  ;; Preconditions: hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1
  ;; Effects: add next O0 O2, delete vase O0 O1
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