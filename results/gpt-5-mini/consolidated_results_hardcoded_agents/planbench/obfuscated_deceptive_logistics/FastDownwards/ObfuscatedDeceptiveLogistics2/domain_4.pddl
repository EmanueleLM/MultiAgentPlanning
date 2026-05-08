(define (domain ObfuscatedDeceptiveLogistics2)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (current-time ?t - time)
    (succ ?t1 ?t2 - time)
  )

  ;; Paltry: requires hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;; Effects: make next o0 o2 true, remove vase o0 o1, advance current time
  (:action paltry
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (vase ?o0 ?o1))
      (next ?o0 ?o2)
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Sip: requires hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;; Effects: make vase o0 o1 true, make next o0 o2 false, advance current time
  (:action sip
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Clip: requires hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;; Effects: make vase o0 o1 true, make next o0 o2 false, advance current time
  (:action clip
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Wretched: requires sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ;; Effects: make next o0 o2 true, make next o0 o1 false, advance current time
  (:action wretched
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 ?o3 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
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
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Memory: requires cats o0, spring o1, spring o2, next o0 o1
  ;; Effects: make next o0 o2 true, make next o0 o1 false, advance current time
  (:action memory
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Tightfisted: requires hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;; Effects: make next o0 o2 true, make vase o0 o1 false, advance current time
  (:action tightfisted
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

)