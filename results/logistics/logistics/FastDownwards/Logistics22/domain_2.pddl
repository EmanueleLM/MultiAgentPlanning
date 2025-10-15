(define (domain multiagent-usecase)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
  )

  (:action paltry
    :parameters (?hand - object ?cat - object ?tex - object)
    :precondition (and (hand ?hand) (cats ?cat) (texture ?tex) (vase ?hand ?cat) (next ?cat ?tex))
    :effect (and (next ?hand ?tex) (not (vase ?hand ?cat)))
  )

  (:action sip
    :parameters (?hand - object ?cat - object ?tex - object)
    :precondition (and (hand ?hand) (cats ?cat) (texture ?tex) (next ?hand ?tex) (next ?cat ?tex))
    :effect (and (vase ?hand ?cat) (not (next ?hand ?tex)))
  )

  (:action clip
    :parameters (?hand - object ?sneeze_obj - object ?tex - object)
    :precondition (and (hand ?hand) (sneeze ?sneeze_obj) (texture ?tex) (next ?sneeze_obj ?tex) (next ?hand ?tex))
    :effect (and (vase ?hand ?sneeze_obj) (not (next ?hand ?tex)))
  )

  (:action wretched
    :parameters (?sneeze_obj - object ?tex1 - object ?tex2 - object ?stup - object)
    :precondition (and (sneeze ?sneeze_obj) (texture ?tex1) (texture ?tex2) (stupendous ?stup) (next ?sneeze_obj ?tex1) (collect ?tex1 ?stup) (collect ?tex2 ?stup))
    :effect (and (next ?sneeze_obj ?tex2) (not (next ?sneeze_obj ?tex1)))
  )

  (:action memory
    :parameters (?cat - object ?from - object ?to - object)
    :precondition (and (cats ?cat) (spring ?from) (spring ?to) (next ?cat ?from))
    :effect (and (next ?cat ?to) (not (next ?cat ?from)))
  )

  (:action tightfisted
    :parameters (?hand - object ?sneeze_obj - object ?tex - object)
    :precondition (and (hand ?hand) (sneeze ?sneeze_obj) (texture ?tex) (next ?sneeze_obj ?tex) (vase ?hand ?sneeze_obj))
    :effect (and (next ?hand ?tex) (not (vase ?hand ?sneeze_obj)))
  )
)