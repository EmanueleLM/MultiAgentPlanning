(define (domain logistics_deceptive)
  (:requirements :strips :typing)
  (:types
    hand cats sneeze texture stupendous - object
    spring - texture
  )

  (:predicates
    ;; next is used to represent the location of an object (hand, cats, or sneeze)
    (next ?o - object ?l - texture)
    ;; vase is used to represent a package (hand) inside a vehicle (cats or sneeze)
    (vase ?p - hand ?v - object)
    ;; collect maps a location (texture) to a city (stupendous)
    (collect ?l - texture ?c - stupendous)
  )

  ;; Paltry represents unloading a package from an airplane (cats)
  (:action paltry
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; Sip represents loading a package into an airplane (cats)
  (:action sip
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; Clip represents loading a package into a truck (sneeze)
  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; Wretched represents moving a truck (sneeze) between locations in the same city (stupendous)
  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
    :precondition (and (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; Memory represents moving an airplane (cats) between airports (spring)
  (:action memory
    :parameters (?o0 - cats ?o1 - spring ?o2 - spring)
    :precondition (and (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; Tightfisted represents unloading a package from a truck (sneeze)
  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)