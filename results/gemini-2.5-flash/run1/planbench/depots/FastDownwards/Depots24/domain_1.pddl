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
        (at ?obj - (truck hoist crate pallet) ?loc - place)
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
            (at ?crate ?place) ; Crate must be at the place to be lifted from a surface there
            (available ?hoist)
            (clear ?crate) ; Nothing on top of the crate itself
            (on ?crate ?surface) ; Crate must be on a surface to be lifted from it
        )
        :effect (and
            (not (at ?crate ?place)) ; Crate is now suspended by hoist, not "at" the place on a surface
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (clear ?surface) ; The surface the crate was on is now clear
            (not (on ?crate ?surface))
        )
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place) ; Surface must be at the place to drop crate onto it
            (clear ?surface) ; Target surface must be clear
            (lifting ?hoist ?crate)
        )
        :effect (and
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (at ?crate ?place) ; Crate is now at the place, on a surface
            (not (clear ?surface)) ; Target surface is no longer clear
            (clear ?crate) ; The dropped crate itself is clear
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
            (clear ?crate) ; The crate itself is clear inside the truck for future operations if any
        )
    )

    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (available ?hoist) ; Hoist must be available to pick up crate from truck
            (in ?crate ?truck)
        )
        :effect (and
            (not (in ?crate ?truck))
            (not (available ?hoist))
            (lifting ?hoist ?crate) ; Hoist is now lifting the crate
            ; Crate remains (not (at ?crate ?place)) until it is dropped onto a surface.
        )
    )
)