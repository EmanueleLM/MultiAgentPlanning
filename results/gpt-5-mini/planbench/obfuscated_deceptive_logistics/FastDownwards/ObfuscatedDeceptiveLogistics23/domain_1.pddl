(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    entity - object
    cat sneeze - entity
    hand - object
    texture - object
    spring - texture
    stupendous - object
  )
  (:predicates
    (next ?e - entity ?t - texture)
    (collect ?t - texture ?p - stupendous)
    (vase ?h - hand ?e - entity)
  )
  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )
  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )
  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )
  (:action wretched
    :parameters (?s0 - sneeze ?t1 - texture ?t2 - texture ?p - stupendous)
    :precondition (and (next ?s0 ?t1) (collect ?t1 ?p) (collect ?t2 ?p))
    :effect (and (next ?s0 ?t2) (not (next ?s0 ?t1)))
  )
  (:action memory
    :parameters (?c - cat ?s1 - spring ?s2 - spring)
    :precondition (and (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )
  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (vase ?h ?s) (next ?s ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)