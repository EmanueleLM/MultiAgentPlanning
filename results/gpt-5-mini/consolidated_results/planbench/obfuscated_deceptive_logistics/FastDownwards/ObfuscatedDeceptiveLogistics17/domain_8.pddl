(define (domain obfuscated-deceptive-logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

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
    ;; explicit discrete time / stage progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions require consuming the current stage and advancing to its successor.
  ;; This enforces a strict, contiguous stage progression (no oscillating or
  ;; out-of-order application) and removes implicit bookkeeping shortcuts.
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )
)