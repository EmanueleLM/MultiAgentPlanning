(define (domain depots5)
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
        (at_truck ?t - truck, ?loc - place)
        (at_hoist ?h - hoist, ?loc - place)
        (at_surface ?s - surface, ?loc - place) ; For pallets and crates
        (available ?h - hoist)
        (lifting ?h - hoist, ?c - crate)
        (clear ?s - surface)
        (on ?c - crate, ?s - surface)
        (in ?c - crate, ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at_truck ?t ?from)
        )
        :effect (and
            (not (at_truck ?t ?from))
            (at_truck ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_surface ?c ?p) ; Crate is a surface
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at_surface ?c ?p)) ; Crate is no longer 'at' the place directly
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_surface ?s ?p) ; Surface must be at the place to drop on it
            (clear ?s) ; The surface must be clear to drop something on it
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at_surface ?c ?p) ; Crate is now 'at' the place again
            (not (clear ?s)) ; The surface is no longer clear
            (clear ?c) ; The top of the crate is clear
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)
            (available ?h) ; Hoist must be available to perform unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )