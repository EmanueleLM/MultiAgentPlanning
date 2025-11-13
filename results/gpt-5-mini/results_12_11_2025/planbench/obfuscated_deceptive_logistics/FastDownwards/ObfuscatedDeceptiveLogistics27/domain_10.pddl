(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand cat sneeze stupendous texture stage - obj
  )

  (:predicates
    ;; vase relates a hand to a generic object (second argument can be cat or other object-typed entities)
    (vase ?h - hand ?o - obj)
    (collect ?t - texture ?u - stupendous)
    (spring ?t - texture)
    (next ?x - obj ?y - obj)
    (stage-available ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Each action advances a single discrete stage to enforce contiguous, serial progression.
  (:action paltry
    :parameters (?h - hand ?a - cat ?b - texture ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (vase ?h ?a)
      (next ?a ?b)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (next ?h ?b)
      (not (vase ?h ?a))
    )
  )

  (:action sip
    :parameters (?h - hand ?a - cat ?b - texture ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (next ?h ?b)
      (next ?a ?b)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (vase ?h ?a)
      (not (next ?h ?b))
    )
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?u - stupendous ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cat ?s1 - texture ?s2 - texture ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture ?st - stage ?st2 - stage)
    :precondition (and
      (stage-available ?st)
      (succ ?st ?st2)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (not (stage-available ?st))
      (stage-available ?st2)
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)