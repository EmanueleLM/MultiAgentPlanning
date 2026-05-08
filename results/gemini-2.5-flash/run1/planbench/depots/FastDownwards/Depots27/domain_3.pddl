(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        truck
        hoist
        surface
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?x - (either truck hoist surface) ?l - location) ; Corrected: included 'surface' for pallets and crates
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
            (at ?c ?l) ; Crate must be on a surface at the hoist's location
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (not (on ?c ?s))
            (not (clear ?c)) ; Crate is no longer clear as it's being held
            (not (at ?c ?l)) ; Crate is no longer on a surface at the location, it's being held
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
            (at ?c ?l) ; Crate is now on a surface at the location
            (clear ?c) ; The crate itself is clear after being dropped (as per human spec)
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (holding ?h ?c) ; Crate is being held, so (at ?c ?l) is false
            (at ?h ?l)
            (at ?t ?l)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (loaded ?t ?c) ; Crate is now loaded in truck, so (at ?c ?l) remains false
            (increase (total-cost) 1)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?t ?l)
            (loaded ?t ?c) ; Crate is loaded in truck, so (at ?c ?l) is false
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c) ; Hoist is now holding crate, so (at ?c ?l) remains false
            (not (loaded ?t ?c))
            (increase (total-cost) 1)
        )
    )