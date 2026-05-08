(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        obj ; Supertype for anything that can be at a location
        truck - obj
        hoist - obj
        surface - obj
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?x - obj ?l - location)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (holding ?h - hoist ?c - crate)
        (loaded ?t - truck ?c - crate)
        (available ?h - hoist)
        (connected ?l1 ?l2 - location)
    )
    (:functions
        (total-cost)
    )

    ;; Actions for TruckManager
    (:action drive-truck
        :parameters (?t - truck ?from ?to - location)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Actions for HoistOperator
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?c ?l) ; Crate must be present at the hoist's location
            (on ?c ?s) ; Crate must be on a surface
            (clear ?c) ; Crate must be clear to be lifted
        )
        :effect (and
            (not (available ?h))
            (not (on ?c ?s))
            (not (clear ?c)) ; Crate is no longer clear as it's being held
            (not (at ?c ?l)) ; Crate is no longer resting at the location
            (holding ?h ?c)
            (clear ?s) ; The surface it was on is now clear
            (increase (total-cost) 1)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (holding ?h ?c)
            (at ?h ?l)
            (at ?s ?l) ; Target surface must be at the hoist's location
            (clear ?s) ; Target surface must be clear to drop onto
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (on ?c ?s)
            (not (clear ?s)) ; Surface is no longer clear
            (at ?c ?l) ; Crate is now resting on a surface at the location
            (clear ?c) ; The crate itself is clear after being dropped
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (holding ?h ?c) ; Hoist must be lifting the crate
            (at ?h ?l)
            (at ?t ?l)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (loaded ?t ?c) ; Crate is now loaded in the truck
            (increase (total-cost) 1)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (available ?h) ; Hoist must be available to perform unload
            (at ?h ?l)
            (at ?t ?l)
            (loaded ?t ?c) ; Crate must be loaded in the truck
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c) ; Hoist is now holding the crate
            (not (loaded ?t ?c))
            (increase (total-cost) 1)
        )
    )
)