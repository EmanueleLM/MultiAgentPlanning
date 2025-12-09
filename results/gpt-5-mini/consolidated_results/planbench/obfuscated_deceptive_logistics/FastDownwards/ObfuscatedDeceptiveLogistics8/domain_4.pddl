(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj cat hand sneeze stupendous)

  (:predicates
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - obj ?o2 - obj ?o3 - stupendous)
    :precondition (and
      (texture ?o1)
      (texture ?o2)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - cat ?o1 - obj ?o2 - obj)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)