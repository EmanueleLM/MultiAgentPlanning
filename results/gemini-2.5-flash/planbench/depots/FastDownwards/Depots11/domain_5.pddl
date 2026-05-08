(define (domain depots11)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        physical_object
        hoist truck - physical_object
        depot distributor - place
        crate - surface physical_object
        pallet - surface physical_object
    )
    (:predicates
        (at ?obj - physical_object ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
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
            (on ?c ?s)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (at ?c ?p))
            (not (on ?c ?s))
            (clear ?s)
            (not (available ?h))
            (lifting ?h ?c)
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
            (not (at ?c ?p)) ; Crate is no longer directly at the place, but in the truck
        )
    )

    (:action unload_crate
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
            (not (at ?c ?p)) ; Explicitly state crate is not at the place while being lifted
        )
    )
)