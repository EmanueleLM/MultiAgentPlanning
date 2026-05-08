(define (domain depots14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        truck
        hoist
        surface
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?obj - (truck hoist pallet crate) ?loc - place) ; objects that are at a specific place, not being lifted or in a truck
        (on ?crate - crate ?surface - surface) ; ?crate is resting on ?surface
        (clear ?surface - surface) ; nothing is on ?surface
        (available ?hoist - hoist) ; hoist is not busy
        (lifting ?hoist - hoist ?crate - crate) ; hoist is lifting ?crate
        (in ?crate - crate ?truck - truck) ; ?crate is inside ?truck
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
            (clear ?crate) ; nothing on the crate itself
            (on ?crate ?surface)
        )
        :effect (and
            (not (at ?crate ?place)) ; crate is no longer "at" the place in terms of being on a surface
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (clear ?surface) ; the surface it was on becomes clear
            (not (on ?crate ?surface))
            (not (clear ?crate)) ; it's not a static clear surface while being lifted
        )
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface) ; surface must be clear to drop something on it
            (lifting ?hoist ?crate)
        )
        :effect (and
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (at ?crate ?place) ; crate is now at the place, on the surface
            (not (clear ?surface)) ; surface is no longer clear
            (clear ?crate) ; crate itself is now clear
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
            (not (at ?crate ?place)) ; crate is no longer "at" the place, but in the truck
            (not (clear ?crate)) ; it's not a static clear surface while in a truck
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
            (not (at ?crate ?place)) ; still not "at" the place until dropped
            (not (clear ?crate)) ; it's not a static clear surface while being lifted
        )
    )
)