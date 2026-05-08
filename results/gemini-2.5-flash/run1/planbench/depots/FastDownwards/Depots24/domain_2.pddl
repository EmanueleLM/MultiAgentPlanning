(define (domain depots24)
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
        (at ?obj - (either truck hoist crate pallet) ?loc - place) ; FIXED: Syntax for type disjunction
        (on ?crate - crate ?surface - surface)
        (clear ?surface - surface) ; A surface is clear if nothing is on top of it
        (in ?crate - crate ?truck - truck) ; A crate is inside a truck
        (available ?hoist - hoist) ; A hoist is available to perform an action
        (lifting ?hoist - hoist ?crate - crate) ; A hoist is currently lifting a crate
        (road ?from - place ?to - place) ; Road connection between two places
    )

    (:action drive
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (road ?from ?to)
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
            (at ?surface ?place) ; ADDED: Surface must be at the same place to lift a crate from it
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
            (in ?crate ?truck)
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (clear ?crate)
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
        )
    )
)