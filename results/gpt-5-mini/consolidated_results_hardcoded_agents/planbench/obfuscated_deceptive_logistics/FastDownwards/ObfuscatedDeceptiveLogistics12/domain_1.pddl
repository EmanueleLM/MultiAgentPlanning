(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)

    ;; explicit discrete time progression
    (current ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Each action consumes the current stage token and advances to a successor stage.
  ;; This enforces an explicit, contiguous discrete-time ordering: every executed action
  ;; must be applied at the current stage and progresses the "current" marker to a successor.
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (hand ?o0) (cats ?o1) (texture ?o2)
      (vase ?o0 ?o1) (next ?o1 ?o2)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (hand ?o0) (cats ?o1) (texture ?o2)
      (next ?o0 ?o2) (next ?o1 ?o2)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (hand ?o0) (sneeze ?o1) (texture ?o2)
      (next ?o1 ?o2) (next ?o0 ?o2)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3) (collect ?o2 ?o3)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (cats ?o0) (spring ?o1) (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t) (succ ?t ?t2)
      (hand ?o0) (sneeze ?o1) (texture ?o2)
      (next ?o1 ?o2) (vase ?o0 ?o1)
    )
    :effect (and
      (not (current ?t)) (current ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)