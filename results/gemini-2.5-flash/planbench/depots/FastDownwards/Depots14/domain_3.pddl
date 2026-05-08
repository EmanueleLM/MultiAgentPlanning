(define (domain depots14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        obj_located
        place
        depot distributor - place
        truck - obj_located
        hoist - obj_located
        surface - obj_located
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?obj - obj_located ?loc - place)
        (on ?crate - crate ?surface - surface)
        (clear ?surface - surface)
        (available ?hoist - hoist)
        (lifting ?hoist - hoist ?crate - crate)
        (in ?crate - crate ?truck - truck)
    )

    (:action drive
        :parameters (?truck - truck ?from ?to - place)
        :precondition (and
            (at ?truck ?from)
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action lift
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?crate ?place)
            (available ?hoist)
            (clear ?crate)
            (on ?crate ?surface)
        )
        :effect (and
            (not (at ?crate ?place))
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (clear ?surface)
            (not (on ?crate ?surface))
            (not (clear ?crate))
        )
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface)
            (lifting ?hoist ?crate)
        )
        :effect (and
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (at ?crate ?place)
            (not (clear ?surface))
            (clear ?crate)
            (on ?crate ?surface)
        )
    )

    (:action load
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (lifting ?hoist ?crate)
        )
        :effect (and
            (not (lifting ?hoist ?crate))
            (available ?hoist)
            (in ?crate ?truck)
            (not (at ?crate ?place))
            (not (clear ?crate))
        )
    )

    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (available ?hoist)
            (in ?crate ?truck)
        )
        :effect (and
            (not (in ?crate ?truck))
            (not (available ?hoist))
            (lifting ?hoist ?crate)
            ; Crate is now held by hoist, so it's not "at" the place or "clear"
            (not (at ?crate ?place))
            (not (clear ?crate))
        )
    )
)