(define (domain vase-domain)
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

  ;; paltry: uses an existing vase and a next link from the cats node to texture to set hand->texture next
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

  ;; sip: creates a vase by using a hand->texture and cats->texture next links; deletes the hand->texture link used
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

  ;; clip: creates a vase from a hand and a sneeze node sharing the same texture; deletes the hand->texture next link used
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

  ;; wretched: switches which texture a sneeze node points to, requires collect facts and a stupendous object
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

  ;; memory: re-points a cats node from one spring to another
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

  ;; tightfisted: uses an existing vase and a sneeze->texture next to set hand->texture next; deletes the vase used
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