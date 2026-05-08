(define (domain obfuscated_deceptive_logistics40)
  (:requirements :strips :typing)

  (:types
    thing
    hand_obj cat_obj sneeze_obj texture_obj spring_obj stupendous_obj - thing
  )

  (:predicates
    (next ?x - thing ?y - thing)
    (vase_cat ?h - hand_obj ?c - cat_obj)
    (vase_sneeze ?h - hand_obj ?s - sneeze_obj)
    (hand ?x - hand_obj)
    (cats ?x - cat_obj)
    (sneeze ?x - sneeze_obj)
    (texture ?x - texture_obj)
    (spring ?x - spring_obj)
    (stupendous ?x - stupendous_obj)
    (collect ?t - texture_obj ?g - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cat_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase_cat ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase_cat ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - hand_obj ?c - cat_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase_cat ?h ?c)
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
      (vase_sneeze ?h ?s)
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
    :parameters (?c - cat_obj ?s1 - spring_obj ?s2 - spring_obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase_sneeze ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase_sneeze ?h ?s))
    )
  )
)