(define (domain Depots27)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location - object
        depot distributor - location
        surface - object
        pallet crate - surface
        truck - object
        hoist - object
    )
    
    (:predicates
        (at ?t - truck ?l - location)
        (at-hoist ?h - hoist ?l - location)
        
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        
        (loaded ?c - crate ?t - truck)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Truck movement
    (:action DRIVE-TRUCK
        :parameters (?t - truck ?l_from - location ?l_to - location)
        :precondition (and 
            (at ?t ?l_from)
        )
        :effect (and
            (at ?t ?l_to)
            (not (at ?t ?l_from))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Hoist lifts a crate from a surface
    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (on ?c ?s)
            (clear ?c)
            (available ?h)
        )
        :effect (and
            (lifting ?h ?c)
            (clear ?s)
            (not (on ?c ?s))
            (not (clear ?c))
            (not (available ?h))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Hoist drops a crate onto a surface
    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (lifting ?h ?c)
            (clear ?s)
        )
        :effect (and
            (on ?c ?s)
            (available ?h)
            (clear ?c)
            (not (lifting ?h ?c))
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )

    ;; 4. Hoist loads a crate onto a truck
    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (at ?t ?l)
            (lifting ?h ?c)
        )
        :effect (and
            (loaded ?c ?t)
            (available ?h)
            (clear ?c)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )
    
    ;; 5. Hoist unloads a crate from a truck
    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (at-hoist ?h ?l)
            (at ?t ?l)
            (loaded ?c ?t)
            (available ?h) ; Required by human specification
        )
        :effect (and
            (lifting ?h ?c)
            (not (loaded ?c ?t))
            (not (available ?h))
            (increase (total-cost) 1)
        )
    )
)