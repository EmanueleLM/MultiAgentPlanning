(define (domain obfuscated_deceptive_logistics_14)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (next ?o1 ?o2)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?o1 ?o2)
    (spring ?o)
  )

  ;; Action Sip: Load a hand (package) into a cats (vehicle type 1) at a texture (location)
  (:action sip
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (next ?obj0 ?obj2) (next ?obj1 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )

  ;; Action Paltry: Unload a hand (package) from a cats (vehicle type 1) at a texture (location)
  (:action paltry
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (vase ?obj0 ?obj1) (next ?obj1 ?obj2))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )

  ;; Action Clip: Load a hand (package) into a sneeze (vehicle type 2) at a texture (location)
  (:action clip
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (next ?obj0 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )

  ;; Action Tightfisted: Unload a hand (package) from a sneeze (vehicle type 2) at a texture (location)
  (:action tightfisted
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (vase ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )

  ;; Action Memory: Move a cats (vehicle type 1) between spring (type 1 locations)
  (:action memory
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (cats ?obj0) (spring ?obj1) (spring ?obj2) (next ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )

  ;; Action Wretched: Move a sneeze (vehicle type 2) between texture (type 2 locations) in the same stupendous (region)
  (:action wretched
    :parameters (?obj0 ?obj1 ?obj2 ?obj3)
    :precondition (and (sneeze ?obj0) (texture ?obj1) (texture ?obj2) (stupendous ?obj3) (next ?obj0 ?obj1) (collect ?obj1 ?obj3) (collect ?obj2 ?obj3))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )
)