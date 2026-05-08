(define (domain depots28)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        depot distributor - place
        pallet crate - surface
        place
        surface
        truck
        hoist
    )
    (:predicates
        (at ?obj - (or truck hoist crate pallet) ?loc - place) ; Canonicalized 'either' to 'or'
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p) ; Hoist must be at the place
            (at ?c ?p) ; Crate must be at the place
            (at ?s ?p) ; The surface must be at the same place
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer resting at the place
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p) ; Hoist must be at the place
            (at ?s ?p) ; The surface must be at the same place
            (clear ?s) ; Target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now resting at the place
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; Crate on top is clear
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p) ; Hoist must be at the place
            (at ?t ?p) ; Truck must be at the place
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c)) ; Hoist stops lifting
            (in ?c ?t) ; Crate is now in the truck
            (available ?h) ; Hoist becomes available
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p) ; Hoist must be at the place
            (at ?t ?p) ; Truck must be at the place
            (available ?h) ; Hoist must be available to perform unload operation
            (in ?c ?t) ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist becomes busy
            (lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )
)