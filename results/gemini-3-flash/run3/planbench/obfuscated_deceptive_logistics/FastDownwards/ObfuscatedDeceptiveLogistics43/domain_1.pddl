(define (domain obfuscated_deceptive_logistics_43)
        (:requirements :strips :typing)
        (:types obj)
        (:predicates
            (hand ?o - obj)
            (cats ?o - obj)
            (texture ?o - obj)
            (vase ?v - obj ?p - obj)
            (next ?o1 - obj ?o2 - obj)
            (sneeze ?o - obj)
            (stupendous ?o - obj)
            (collect ?l - obj ?a - obj)
            (spring ?o - obj)
        )

        ;; Unload a cats-type package and move the vehicle (hand) to the location
        (:action paltry
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
            :precondition (and 
                (hand ?obj0) 
                (cats ?obj1) 
                (texture ?obj2) 
                (vase ?obj0 ?obj1) 
                (next ?obj1 ?obj2)
            )
            :effect (and 
                (next ?obj0 ?obj2) 
                (not (vase ?obj0 ?obj1))
            )
        )

        ;; Load a cats-type package into the vehicle (hand)
        (:action sip
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
            :precondition (and 
                (hand ?obj0) 
                (cats ?obj1) 
                (texture ?obj2) 
                (next ?obj0 ?obj2) 
                (next ?obj1 ?obj2)
            )
            :effect (and 
                (vase ?obj0 ?obj1) 
                (not (next ?obj0 ?obj2))
            )
        )

        ;; Load a sneeze-type package into the vehicle (hand)
        (:action clip
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
            :precondition (and 
                (hand ?obj0) 
                (sneeze ?obj1) 
                (texture ?obj2) 
                (next ?obj1 ?obj2) 
                (next ?obj0 ?obj2)
            )
            :effect (and 
                (vase ?obj0 ?obj1) 
                (not (next ?obj0 ?obj2))
            )
        )

        ;; Move a sneeze-type package between locations sharing a stupendous property
        (:action wretched
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj ?obj3 - obj)
            :precondition (and 
                (sneeze ?obj0) 
                (texture ?obj1) 
                (texture ?obj2) 
                (stupendous ?obj3) 
                (next ?obj0 ?obj1) 
                (collect ?obj1 ?obj3) 
                (collect ?obj2 ?obj3)
            )
            :effect (and 
                (next ?obj0 ?obj2) 
                (not (next ?obj0 ?obj1))
            )
        )

        ;; Move a cats-type package between spring-type locations
        (:action memory
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
            :precondition (and 
                (cats ?obj0) 
                (spring ?obj1) 
                (spring ?obj2) 
                (next ?obj0 ?obj1)
            )
            :effect (and 
                (next ?obj0 ?obj2) 
                (not (next ?obj0 ?obj1))
            )
        )

        ;; Unload a sneeze-type package and move the vehicle (hand) to the location
        (:action tightfisted
            :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
            :precondition (and 
                (hand ?obj0) 
                (sneeze ?obj1) 
                (texture ?obj2) 
                (next ?obj1 ?obj2) 
                (vase ?obj0 ?obj1)
            )
            :effect (and 
                (next ?obj0 ?obj2) 
                (not (vase ?obj0 ?obj1))
            )
        )
    )