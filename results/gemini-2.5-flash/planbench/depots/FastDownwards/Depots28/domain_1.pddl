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
        (at ?obj - (truck hoist crate pallet) ?loc - place)
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
            (at ?h ?p)
            (at ?s ?p) ; The surface must be at the same place as the hoist
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer resting at the place
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The surface must be at the same place as the hoist
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now resting at the place
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (in ?c ?t)
            (available ?h)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)