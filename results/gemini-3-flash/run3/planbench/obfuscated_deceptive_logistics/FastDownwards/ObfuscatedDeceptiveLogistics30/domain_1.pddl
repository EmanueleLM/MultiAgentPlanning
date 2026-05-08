(define (domain obfuscated_deceptive_logistics_30)
  (:requirements :strips :typing)
  (:types
    hand cats sneeze texture stupendous - object
  )

  (:predicates
    (hand ?h - hand)
    (cats ?c - cats)
    (sneeze ?s - sneeze)
    (texture ?t - texture)
    (stupendous ?st - stupendous)
    (spring ?t - texture)
    (vase ?h - hand ?z - object) ; ?z can be cats or sneeze
    (next ?obj - object ?t - texture) ; ?obj can be hand, cats, or sneeze
    (collect ?t - texture ?st - stupendous)
  )

  ; Loads a hand from a cats zone at a specific texture
  (:action sip
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ; Unloads a hand from a cats zone at a specific texture
  (:action paltry
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ; Loads a hand from a sneeze zone at a specific texture
  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ; Unloads a hand from a sneeze zone at a specific texture
  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )

  ; Moves a sneeze zone between textures sharing the same stupendous group
  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ; Moves a cats zone between spring-type textures
  (:action memory
    :parameters (?c - cats ?sp1 - texture ?sp2 - texture)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )
)