(define (domain domain_analyst)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (cats ?x - obj)
    (collect ?x - obj ?y - obj)
    (hand ?x - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
  )

  (:action paltry
    :parameters (?o_hand - obj ?o_cat - obj ?o_tex - obj)
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
    :parameters (?o_hand - obj ?o_cat - obj ?o_tex - obj)
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
    :parameters (?o_hand - obj ?o_sneeze - obj ?o_tex - obj)
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
    :parameters (?o_sneezer - obj ?o_from_tex - obj ?o_to_tex - obj ?o_group - obj)
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
    :parameters (?o_cat - obj ?o_from_spring - obj ?o_to_spring - obj)
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
    :parameters (?o_hand - obj ?o_sneeze - obj ?o_tex - obj)
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