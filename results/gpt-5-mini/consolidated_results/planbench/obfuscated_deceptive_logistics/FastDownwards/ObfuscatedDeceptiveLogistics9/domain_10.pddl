(define (domain obfuscated-deceptive-logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

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
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Each action requires the planner to be at a specific stage 'current ?s'
  ;; and advances the current stage to its immediate successor 'succ ?s ?s2'.
  ;; This enforces contiguous discrete progression of time and prevents
  ;; oscillation or re-use of the same stage for multiple actions.

  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
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
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )
)