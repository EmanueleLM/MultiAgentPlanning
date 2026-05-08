(define (domain depots14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place ; Added subtypes of place
        truck
        hoist
        surface
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?obj - (either truck hoist pallet crate) ?loc - place) ; Fixed syntax for 'either' type
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
            (not (clear ?crate)) ; Crate is no longer a clear surface when lifted
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
            (clear ?crate) ; Crate is now a clear surface
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
            (not (clear ?crate)) ; Crate is no longer a clear surface when in a truck
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
            (not (at ?crate ?place)) ; Crate is still not "at" a surface until dropped
            (not (clear ?crate)) ; Crate is not a clear surface when lifted
        )
    )
)