(define (domain depots7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at ?obj - (or truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place on a surface
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; Destination surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place on a surface
            (not (clear ?s)) ; Destination surface is no longer clear
            (clear ?c) ; Crate itself is now clear
            (on ?c ?s)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (in ?c ?tr)
            (not (at ?c ?p)) ; Crate is no longer at the place on a surface
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (available ?h) ; Hoist must be available to unload
            (in ?c ?tr)
        )
        :effect (and
            (not (in ?c ?tr))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)