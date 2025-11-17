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
    ;; explicit discrete stage progression to enforce ordered action application
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Every action requires being applied at the current stage and advances the current stage to a designated successor.
  ;; This enforces a strict total order on actions (no bookkeeping tokens or post-hoc fixes).

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action wretched
    :parameters (?sneezer - obj ?t1 - obj ?t2 - obj ?stp - obj ?st - stage ?st2 - stage)
    :precondition (and
      (sneeze ?sneezer)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?sneezer ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?sneezer ?t2)
      (not (next ?sneezer ?t1))
      (not (current ?st))
      (current ?st2)
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
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
      (not (current ?st))
      (current ?st2)
    )
  )
)