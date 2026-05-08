(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  ;; Predicates
  (:predicates
    (hand ?x - obj)
    (cat ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    ;; Stage progression predicates to enforce monotonic, contiguous occupancy
    (at-stage ?x - obj ?st - stage)
    (succ-stage ?st1 - stage ?st2 - stage)
  )

  ;; Action: paltry
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?nst - stage)
    :precondition (and
      (hand ?h)
      (cat ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (at-stage ?h ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (at-stage ?h ?st))
      (at-stage ?h ?nst)
    )
  )

  ;; Action: sip
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?nst - stage)
    :precondition (and
      (hand ?h)
      (cat ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (at-stage ?h ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (at-stage ?h ?st))
      (at-stage ?h ?nst)
    )
  )

  ;; Action: clip
  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?nst - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (at-stage ?h ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (at-stage ?h ?st))
      (at-stage ?h ?nst)
    )
  )

  ;; Action: wretched
  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?sp - obj ?st - stage ?nst - stage)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?sn ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
      (at-stage ?sn ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      (not (at-stage ?sn ?st))
      (at-stage ?sn ?nst)
    )
  )

  ;; Action: memory
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?nst - stage)
    :precondition (and
      (cat ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (at-stage ?c ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (at-stage ?c ?st))
      (at-stage ?c ?nst)
    )
  )

  ;; Action: tightfisted
  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?nst - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (at-stage ?h ?st)
      (succ-stage ?st ?nst)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (at-stage ?h ?st))
      (at-stage ?h ?nst)
    )
  )

)