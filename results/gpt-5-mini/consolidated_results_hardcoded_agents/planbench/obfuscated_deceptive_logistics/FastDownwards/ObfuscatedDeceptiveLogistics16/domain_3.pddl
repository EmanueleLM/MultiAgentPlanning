(define (domain obfuscated_deceptive_logistics16)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    spring - texture
    texture hand cat sneeze stupendous - object
  )

  (:predicates
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (collect ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - texture)
    :precondition (and
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - texture)
    :precondition (and
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
    :precondition (and
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - cat ?o1 - spring ?o2 - spring)
    :precondition (and
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)