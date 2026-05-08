(define (domain depots14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        surface - object
        depot distributor - place
        pallet crate - surface
        truck hoist - object
    )

    (:predicates
        (at ?obj - object ?p - place) ; Revised to use the common supertype 'object'
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (hoist_available ?h - hoist)
        (hoist_lifting ?h - hoist ?c - crate)
        (in_truck ?c - crate ?t - truck)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action lift_crate
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?crate ?place)
            (at ?surface ?place)
            (hoist_available ?hoist)
            (clear ?crate)
            (on ?crate ?surface)
        )
        :effect (and
            (not (at ?crate ?place))
            (hoist_lifting ?hoist ?crate)
            (not (hoist_available ?hoist))
            (clear ?surface)
            (not (on ?crate ?surface))
        )
    )

    (:action drop_crate
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface)
            (hoist_lifting ?hoist ?crate)
        )
        :effect (and
            (hoist_available ?hoist)
            (not (hoist_lifting ?hoist ?crate))
            (at ?crate ?place)
            (not (clear ?surface))
            (clear ?crate)
            (on ?crate ?surface)
        )
    )

    (:action load_crate
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (hoist_lifting ?hoist ?crate)
        )
        :effect (and
            (hoist_available ?hoist)
            (not (hoist_lifting ?hoist ?crate))
            (in_truck ?crate ?truck)
        )
    )

    (:action unload_crate
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (hoist_available ?hoist)
            (in_truck ?crate ?truck)
        )
        :effect (and
            (not (in_truck ?crate ?truck))
            (not (hoist_available ?hoist))
            (hoist_lifting ?hoist ?crate)
        )
    )
)