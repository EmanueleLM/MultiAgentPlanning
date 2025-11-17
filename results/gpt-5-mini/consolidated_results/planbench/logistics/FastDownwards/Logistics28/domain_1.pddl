(define (domain logistics28)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (collect ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (free ?t - time)
    (used ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ;; paltry: requires vase(o0,o1) and next(o1,o2); produces next(o0,o2) and removes vase(o0,o1)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2) (free ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (used ?t) (not (vase ?o0 ?o1)) (not (free ?t)))
  )

  ;; sip: requires next(o0,o2) and next(o1,o2); produces vase(o0,o1) and removes next(o0,o2)
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2) (free ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (used ?t) (not (next ?o0 ?o2)) (not (free ?t)))
  )

  ;; clip: requires next(o1,o2) and next(o0,o2); produces vase(o0,o1) and removes next(o0,o2)
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2) (free ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (used ?t) (not (next ?o0 ?o2)) (not (free ?t)))
  )

  ;; wretched: requires next(o0,o1) and collect(o1,o3) and collect(o2,o3); produces next(o0,o2) and removes next(o0,o1)
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - time ?t2 - time)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3) (free ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (used ?t) (not (next ?o0 ?o1)) (not (free ?t)))
  )

  ;; memory: requires next(o0,o1) and spring(o1) and spring(o2); produces next(o0,o2) and removes next(o0,o1)
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1) (free ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (used ?t) (not (next ?o0 ?o1)) (not (free ?t)))
  )

  ;; tightfisted: requires vase(o0,o1) and next(o1,o2); produces next(o0,o2) and removes vase(o0,o1)
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1) (free ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (used ?t) (not (vase ?o0 ?o1)) (not (free ?t)))
  )
)