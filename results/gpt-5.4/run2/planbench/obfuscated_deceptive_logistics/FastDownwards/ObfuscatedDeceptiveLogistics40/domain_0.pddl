(define (domain jackofalltrades_instance)
  (:requirements :strips :typing)

  (:types
    obj
    hand cats sneeze texture stupendous - obj
    spring - texture
  )

  (:predicates
    (next ?x - obj ?y - obj)
    (vase ?h - hand ?r - obj)

    (hand ?x - hand)
    (cats ?x - cats)
    (sneeze ?x - sneeze)
    (texture ?x - texture)
    (spring ?x - spring)
    (stupendous ?x - stupendous)
    (collect ?t - texture ?s - stupendous)
  )

  (:action paltry
    :parameters (?h - hand ?c - cats ?t - texture)
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
    :parameters (?h - hand ?c - cats ?t - texture)
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
    :parameters (?h - hand ?s - sneeze ?t - texture)
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
    :parameters (?s - sneeze ?t_from - texture ?t_to - texture ?g - stupendous)
    :precondition (and
      (sneeze ?s)
      (texture ?t_from)
      (texture ?t_to)
      (stupendous ?g)
      (next ?s ?t_from)
      (collect ?t_from ?g)
      (collect ?t_to ?g)
    )
    :effect (and
      (next ?s ?t_to)
      (not (next ?s ?t_from))
    )
  )

  (:action memory
    :parameters (?c - cats ?s_from - spring ?s_to - spring)
    :precondition (and
      (cats ?c)
      (spring ?s_from)
      (spring ?s_to)
      (next ?c ?s_from)
    )
    :effect (and
      (next ?c ?s_to)
      (not (next ?c ?s_from))
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
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