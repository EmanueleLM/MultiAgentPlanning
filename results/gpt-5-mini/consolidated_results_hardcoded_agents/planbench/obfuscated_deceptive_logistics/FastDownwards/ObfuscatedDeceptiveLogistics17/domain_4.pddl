(define (domain obfuscated-deceptive-logistics-17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    texture - obj
    spring - texture
    hand - obj
    cat - obj
    sneeze - obj
    stupendous - obj
  )

  (:predicates
    (vase ?h - hand ?x - obj)
    (next ?o - obj ?t - texture)
    (collect ?t - texture ?st - stupendous)
  )

  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and
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
    :parameters (?c - cat ?sp1 - spring ?sp2 - spring)
    :precondition (and
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)