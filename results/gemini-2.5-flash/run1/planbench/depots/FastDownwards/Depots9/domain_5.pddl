(define (domain Depots9)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )

    (:predicates
        (at_truck ?t - truck ?p - place)
        (at_hoist ?h - hoist ?p - place)
        (at_surface ?s - surface ?p - place) ; For pallets and crates when on the ground/fixed
        (connected ?p1 ?p2 - place)
        (available ?h - hoist)
        (on ?c - crate ?s - pallet) ; <--- REPAIR: Restricted to pallet
        (in ?c - crate ?t - truck)
        (holding ?h - hoist ?c - crate)
        (clear ?s - surface)
    )

    (:action DRIVE
        :parameters (?t - truck ?p1 ?p2 - place)
        :precondition (and
            (at_truck ?t ?p1)
            (connected ?p1 ?p2)
        )
        :effect (and
            (not (at_truck ?t ?p1))
            (at_truck ?t ?p2)
        )
    )

    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - pallet ?p - place) ; <--- REPAIR: ?s is pallet
        :precondition (and
            (at_hoist ?h ?p)
            (at_surface ?c ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (on ?c ?s))
            (clear ?s)
            (not (available ?h))
            (holding ?h ?c)
            (not (at_surface ?c ?p))
        )
    )

    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - pallet ?p - place) ; <--- REPAIR: ?s is pallet
        :precondition (and
            (at_hoist ?h ?p)
            (holding ?h ?c)
            (clear ?s)
            (at_surface ?s ?p)
        )
        :effect (and
            (not (holding ?h ?c))
            (available ?h)
            (at_surface ?c ?p)
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
        )
    )

    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)
            (holding ?h ?c)
        )
        :effect (and
            (not (holding ?h ?c))
            (in ?c ?t)
            (available ?h)
        )
    )

    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)
            (in ?c ?t)
            (available ?h)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (holding ?h ?c)
        )
    )
)