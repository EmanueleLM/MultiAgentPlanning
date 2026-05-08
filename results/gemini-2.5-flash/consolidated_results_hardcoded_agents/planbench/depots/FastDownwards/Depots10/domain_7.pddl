(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        crate - surface
        pallet - surface
        surface - object
        truck - object
        hoist - object
        depot - place
        distributor - place
        place - object
    )

    (:predicates
        (at ?obj - object ?loc - place)
        (in ?c - crate ?t - truck)
        (on ?c1 - crate ?s2 - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (holding ?h - hoist ?c - crate)
        (connected ?p1 - place ?p2 - place)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action A_Drive_Truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and 
            (at ?t ?p1)
            (connected ?p1 ?p2)
        )
        :effect (and 
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    (:action A_Lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p) ; Crate must be physically located at P
            (at ?s ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (holding ?h ?c)
            (not (available ?h))
            (not (clear ?c))
            (clear ?s)
            (not (on ?c ?s))
            (not (at ?c ?p)) ; Crate leaves the location P
            (increase (total-cost) 1)
        )
    )
    
    (:action A_Drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (holding ?h ?c)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (on ?c ?s)
            (at ?c ?p) 
            (clear ?c)
            (not (holding ?h ?c))
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )

    (:action A_Load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (holding ?h ?c)
        )
        :effect (and
            (available ?h)
            (in ?c ?t)
            (not (holding ?h ?c))
            (increase (total-cost) 1)
        )
    )

    (:action A_Unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (holding ?h ?c)
            (not (available ?h))
            (not (in ?c ?t))
            (increase (total-cost) 1)
        )
    )
)