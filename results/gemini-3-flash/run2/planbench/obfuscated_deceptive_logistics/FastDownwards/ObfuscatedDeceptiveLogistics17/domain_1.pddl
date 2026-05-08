(define (domain obfuscated_deceptive_logistics_17)
  (:requirements :strips :typing)
  (:types
    hand cats sneeze texture stupendous - object
    spring - texture
  )

  (:predicates
    (collect ?t - texture ?s - stupendous)
    (vase ?h - hand ?obj - object)
    (next ?obj1 - object ?obj2 - object)
  )

  ;; paltry: Move a hand object from a cats object to a texture object
  (:action paltry
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip: Move a hand object from a texture object to a cats object
  (:action sip
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip: Move a hand object from a texture object to a sneeze object
  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched: Move a sneeze object from one texture to another within the same stupendous region
  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; memory: Move a cats object between spring locations
  (:action memory
    :parameters (?c - cats ?sp1 - spring ?sp2 - spring)
    :precondition (next ?c ?sp1)
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  ;; tightfisted: Move a hand object from a sneeze object to a texture object
  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)