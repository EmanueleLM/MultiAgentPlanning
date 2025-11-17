(define (domain Logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj cat hand sneeze_t stup_t spring_t)

  (:predicates
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
  )

  (:action paltry
    :parameters (?h - hand ?c - cat ?t - obj)
    :precondition (and
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - hand ?c - cat ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze_t ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze_t ?t1 - obj ?t2 - obj ?st - stup_t)
    :precondition (and
      (texture ?t1)
      (texture ?t2)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cat ?s1 - spring_t ?s2 - spring_t)
    :precondition (and
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze_t ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)