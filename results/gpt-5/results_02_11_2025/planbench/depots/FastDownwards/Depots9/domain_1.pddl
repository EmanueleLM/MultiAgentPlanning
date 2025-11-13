(define (domain Depots9)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (cats ?x - object)
    (collect ?x - object ?y - object)
    (hand ?x - object)
    (next ?x - object ?y - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (texture ?x - object)
    (vase ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?o_hand - object ?o_cat - object ?o_tex - object)
    :precondition (and
      (hand ?o_hand)
      (cats ?o_cat)
      (texture ?o_tex)
      (vase ?o_hand ?o_cat)
      (next ?o_cat ?o_tex)
    )
    :effect (and
      (next ?o_hand ?o_tex)
      (not (vase ?o_hand ?o_cat))
    )
  )

  (:action sip
    :parameters (?o_hand - object ?o_cat - object ?o_tex - object)
    :precondition (and
      (hand ?o_hand)
      (cats ?o_cat)
      (texture ?o_tex)
      (next ?o_hand ?o_tex)
      (next ?o_cat ?o_tex)
    )
    :effect (and
      (vase ?o_hand ?o_cat)
      (not (next ?o_hand ?o_tex))
    )
  )

  (:action clip
    :parameters (?o_hand - object ?o_sneeze - object ?o_tex - object)
    :precondition (and
      (hand ?o_hand)
      (sneeze ?o_sneeze)
      (texture ?o_tex)
      (next ?o_sneeze ?o_tex)
      (next ?o_hand ?o_tex)
    )
    :effect (and
      (vase ?o_hand ?o_sneeze)
      (not (next ?o_hand ?o_tex))
    )
  )

  (:action wretched
    :parameters (?o_sneezer - object ?o_from_tex - object ?o_to_tex - object ?o_group - object)
    :precondition (and
      (sneeze ?o_sneezer)
      (texture ?o_from_tex)
      (texture ?o_to_tex)
      (stupendous ?o_group)
      (next ?o_sneezer ?o_from_tex)
      (collect ?o_from_tex ?o_group)
      (collect ?o_to_tex ?o_group)
    )
    :effect (and
      (next ?o_sneezer ?o_to_tex)
      (not (next ?o_sneezer ?o_from_tex))
    )
  )

  (:action memory
    :parameters (?o_cat - object ?o_from_spring - object ?o_to_spring - object)
    :precondition (and
      (cats ?o_cat)
      (spring ?o_from_spring)
      (spring ?o_to_spring)
      (next ?o_cat ?o_from_spring)
    )
    :effect (and
      (next ?o_cat ?o_to_spring)
      (not (next ?o_cat ?o_from_spring))
    )
  )

  (:action tightfisted
    :parameters (?o_hand - object ?o_sneeze - object ?o_tex - object)
    :precondition (and
      (hand ?o_hand)
      (sneeze ?o_sneeze)
      (texture ?o_tex)
      (next ?o_sneeze ?o_tex)
      (vase ?o_hand ?o_sneeze)
    )
    :effect (and
      (next ?o_hand ?o_tex)
      (not (vase ?o_hand ?o_sneeze))
    )
  )
)