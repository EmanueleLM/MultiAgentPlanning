(define (domain obfuscated_deceptive_logistics_37)
  (:requirements :strips :typing)

  (:types
    object
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - object
  )

  (:predicates
    (hand ?h - hand_obj)
    (cats ?c - cats_obj)
    (sneeze ?s - sneeze_obj)
    (texture ?t - texture_obj)
    (spring ?sp - spring_obj)
    (stupendous ?g - stupendous_obj)
    (next ?x - object ?y - object)
    (vase ?h - hand_obj ?x - object)
    (collect ?t - object ?g - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cats_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
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
    :parameters (?h - hand_obj ?c - cats_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
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
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
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
    :parameters (?s - sneeze_obj ?t1 - texture_obj ?t2 - texture_obj ?g - stupendous_obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?g)
      (next ?s ?t1)
      (collect ?t1 ?g)
      (collect ?t2 ?g)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cats_obj ?sp1 - spring_obj ?sp2 - spring_obj)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
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