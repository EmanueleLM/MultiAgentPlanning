(define (domain depots19)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        hoist
        truck
        ;; Subtypes
        depot distributor - place
        pallet crate - surface
    )

    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; Added: Surface must be at the same place as hoist and crate
            (on ?c ?s)
            (clear ?c)
            (available ?h)
        )
        :effect (and
            (not (at ?c ?p))
            (not (on ?c ?s))
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s)
            ;; Removed (not (clear ?c)) as it was not explicitly in the human specification's effects for lift.
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (not (clear ?s))
            (not (lifting ?h ?c))
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
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
            (available ?h)
            (in ?c ?t)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
            (available ?h)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)