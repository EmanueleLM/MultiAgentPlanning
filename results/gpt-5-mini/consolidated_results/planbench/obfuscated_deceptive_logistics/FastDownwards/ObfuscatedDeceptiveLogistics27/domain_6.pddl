(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand cat sneeze stupendous texture stage - obj
  )

  (:predicates
    ;; attribute predicates (explicitly modeled as facts)
    (hand ?x - hand)
    (cats ?x - cat)
    (sneeze ?x - sneeze)
    (stupendous ?x - stupendous)
    (texture ?x - texture)
    (spring ?x - texture)

    ;; relations
    (collect ?t - texture ?u - stupendous)
    (vase ?h - hand ?x - obj)
    (next ?x - obj ?y - obj)

    ;; stage/time control (explicit discrete time, contiguity enforced)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Actions encode original preconditions/effects exactly and require a stage
  ;; parameter plus successor so that every action advances the single global stage.
  (:action paltry
    :parameters (?h - hand ?a - cat ?b - texture ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
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
    :parameters (?h - hand ?a - cat ?b - texture ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
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
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
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
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
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
      (cats ?c)
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
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
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