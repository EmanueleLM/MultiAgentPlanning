(define (domain depots24)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        item ; Supertype for all movable objects
        surface - item ; Surfaces are items
        pallet crate - surface ; Pallets and crates are surfaces, thus also items
        truck - item ; Trucks are items
        hoist - item ; Hoists are items
    )

    (:predicates
        (at ?obj - item ?loc - place) ; All items (truck, hoist, crate, pallet) can be at a place
        (on ?crate - crate ?surface - surface) ; ?crate is on ?surface
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
            (at ?surface ?place)
            (available ?hoist)
            (clear ?crate) ; The crate itself must be clear to be lifted
            (on ?crate ?surface) ; The crate must be on a surface
        )
        :effect (and
            (not (at ?crate ?place)) ; Crate is no longer at the place on a surface
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (clear ?surface) ; The surface it was on is now clear
            (not (on ?crate ?surface))
        )
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface) ; Target surface must be clear to drop onto
            (lifting ?hoist ?crate)
        )
        :effect (and
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (at ?crate ?place) ; Crate is now at the place, on a surface
            (not (clear ?surface)) ; Target surface is no longer clear
            (clear ?crate) ; Crate itself is clear (nothing on it)
            (on ?crate ?surface)
        )
    )

    (:action load
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (lifting ?hoist ?crate) ; Hoist must be lifting the crate
        )
        :effect (and
            (in ?crate ?truck) ; Crate is now inside the truck
            (available ?hoist)
            (not (lifting ?hoist ?crate))
            (clear ?crate) ; Crate is clear (nothing on it while in truck)
            (not (at ?crate ?place)) ; Crate is no longer directly at the place
        )
    )

    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (available ?hoist) ; Hoist must be available to unload
            (in ?crate ?truck)
        )
        :effect (and
            (not (in ?crate ?truck)) ; Crate is no longer in the truck
            (not (available ?hoist))
            (lifting ?hoist ?crate) ; Hoist is now lifting the crate
            (not (at ?crate ?place)) ; Crate is no longer directly at the place
        )
    )
)