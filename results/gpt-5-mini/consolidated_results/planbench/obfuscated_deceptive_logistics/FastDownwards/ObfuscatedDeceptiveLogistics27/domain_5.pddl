(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand cat sneeze stupendous texture stage - obj
  )

  (:predicates
    (collect ?t - texture ?u - stupendous)
    (vase ?h - hand ?x - obj)
    (next ?x - obj ?y - texture)
    (spring ?t - texture)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?h - hand ?a - obj ?b - texture ?st - stage ?stn - stage)
    :precondition (and
      (vase ?h ?a)
      (next ?a ?b)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?h ?b)
      (not (vase ?h ?a))
      (not (current ?st))
      (current ?stn)
    )
  )

  (:action sip
    :parameters (?h - hand ?a - obj ?b - texture ?st - stage ?stn - stage)
    :precondition (and
      (next ?h ?b)
      (next ?a ?b)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?a)
      (not (next ?h ?b))
      (not (current ?st))
      (current ?stn)
    )
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture ?st - stage ?stn - stage)
    :precondition (and
      (next ?s ?t)
      (next ?h ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
      (not (current ?st))
      (current ?stn)
    )
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?u - stupendous ?st - stage ?stn - stage)
    :precondition (and
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      (not (current ?st))
      (current ?stn)
    )
  )

  (:action memory
    :parameters (?c - cat ?s1 - texture ?s2 - texture ?st - stage ?stn - stage)
    :precondition (and
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current ?st))
      (current ?stn)
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture ?st - stage ?stn - stage)
    :precondition (and
      (vase ?h ?s)
      (next ?s ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
      (not (current ?st))
      (current ?stn)
    )
  )
)