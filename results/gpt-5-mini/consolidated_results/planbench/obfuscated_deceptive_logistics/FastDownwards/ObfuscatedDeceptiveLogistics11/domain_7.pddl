(define (domain obfuscated-deceptive-logistics11)
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
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Actions require and consume a current stage and move to its successor.
  ;; This enforces an explicit discrete time progression and forbids
  ;; oscillation or reusing the same stage for multiple actions.
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?stp - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?sn ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?st2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (current ?s))
      (current ?s2)
    )
  )
)