(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        truck
        hoist
        surface
        pallet - surface
        crate - surface
        object - crate
    )
    (:predicates
        (at ?x - (either truck hoist crate) ?l - location)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (holding ?h - hoist ?c - object)
        (loaded ?t - truck ?c - object)
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
        :parameters (?h - hoist ?c - object ?s - surface ?l - location)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?c ?l) ; Crate must be at the hoist's location
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (not (on ?c ?s))
            (not (clear ?c))
            (not (at ?c ?l)) ; Crate is no longer on a surface at the location
            (holding ?h ?c)
            (clear ?s)
            (increase (total-cost) 1)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - object ?s - surface ?l - location)
        :precondition (and
            (holding ?h ?c)
            (at ?h ?l)
            (at ?s ?l) ; Target surface must be at the hoist's location
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (on ?c ?s)
            (not (clear ?s))
            (at ?c ?l) ; Crate is now on a surface at the location
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - object ?t - truck ?l - location)
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
        :parameters (?h - hoist ?c - object ?t - truck ?l - location)
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