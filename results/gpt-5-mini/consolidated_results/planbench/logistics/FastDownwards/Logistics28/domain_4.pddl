(define (domain logistics28)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)
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
    (succ ?s1 - step ?s2 - step)
    (current-step ?s - step)
  )

  ;; Actions advance the explicit discrete stage: each action requires the current-step
  ;; and a successor step, and effects update current-step to that successor.
  ;; This enforces strict forward-only progression and prevents oscillation.

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (next ?o0 ?o2) (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (vase ?o0 ?o1) (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (vase ?o0 ?o1) (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
      (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (next ?o0 ?o2) (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (next ?o0 ?o2) (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - step ?t2 - step)
    :precondition (and
      (current-step ?t) (succ ?t ?t2)
      (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1)
    )
    :effect (and
      (not (current-step ?t)) (current-step ?t2)
      (next ?o0 ?o2) (not (vase ?o0 ?o1))
    )
  )
)