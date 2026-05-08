(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        truck
        hoist
        surface
        pallet - surface
        crate - surface ; crate is a type of surface
    )
    (:predicates
        (at ?x - (either truck hoist crate) ?l - location)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (holding ?h - hoist ?c - crate) ; Changed from object to crate
        (loaded ?t - truck ?c - crate) ; Changed from object to crate
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
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location) ; Changed from object to crate
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?c ?l) ; Crate must be at the hoist's location, implying it's on a surface at that location
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (not (on ?c ?s))
            (not (clear ?c)) ; Crate is no longer clear as it's being held
            (not (at ?c ?l)) ; Crate is no longer at the location (on a surface), it's being held
            (holding ?h ?c)
            (clear ?s) ; The surface it was on is now clear
            (increase (total-cost) 1)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location) ; Changed from object to crate
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
            (at ?c ?l) ; Crate is now on a surface at the location
            (clear ?c) ; The crate itself is clear after being dropped (as per human spec)
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location) ; Changed from object to crate
        :precondition (and
            (holding ?h ?c)
            (at ?h ?l)
            (at ?t ?l)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (loaded ?t ?c)
            (increase (total-cost) 1)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location) ; Changed from object to crate
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?t ?l)
            (loaded ?t ?c)
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (loaded ?t ?c))
            (increase (total-cost) 1)
        )
    )
)