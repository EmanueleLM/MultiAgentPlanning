(define (domain obfuscated_vase_domain)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 ?o2 - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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
    :parameters (?h - object ?c - object ?t - object)
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
    :parameters (?h - object ?s - object ?t - object)
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
    :parameters (?s - object ?t_from - object ?t_to - object ?st - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t_from)
      (texture ?t_to)
      (stupendous ?st)
      (next ?s ?t_from)
      (collect ?t_from ?st)
      (collect ?t_to ?st)
    )
    :effect (and
      (next ?s ?t_to)
      (not (next ?s ?t_from))
    )
  )

  (:action memory
    :parameters (?c - object ?s_from - object ?s_to - object)
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
    :parameters (?h - object ?s - object ?t - object)
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