(define (domain depots24)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        item ; Supertype for anything that can be at a place
        surface - item
        pallet crate - surface
        truck - item
        hoist - item
    )
    (:predicates
        (at ?obj - item ?loc - place)
        (available ?hoist - hoist)
        (lifting ?hoist - hoist ?crate - crate)
        (clear ?surface - surface) ; True if nothing is on this surface
        (on ?crate - crate ?surface - surface) ; ?crate is on top of ?surface
        (in ?crate - crate ?truck - truck) ; ?crate is inside ?truck
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition
            (and
                (at ?truck ?from)
                (connected ?from ?to)
                (not (= ?from ?to)) ; Truck must move to a different place
            )
        :effect
            (and
                (not (at ?truck ?from))
                (at ?truck ?to)
            )
    )

    (:action lift
        :parameters (?crate - crate ?surface - surface ?hoist - hoist ?p - place)
        :precondition
            (and
                (at ?hoist ?p)
                (at ?crate ?p)
                (at ?surface ?p) ; The surface must also be at the same place where crate and hoist are
                (available ?hoist)
                (on ?crate ?surface)
                (clear ?crate) ; Nothing is on the crate being lifted (it's the topmost crate)
            )
        :effect
            (and
                (not (at ?crate ?p)) ; Crate is now lifted, not resting at the place
                (not (available ?hoist))
                (lifting ?hoist ?crate)
                (not (on ?crate ?surface))
                (clear ?surface) ; The surface below is now clear
                (not (clear ?crate)) ; The crate is now lifted, so it's not "clear" in the stacking sense
            )
    )

    (:action drop
        :parameters (?crate - crate ?surface - surface ?hoist - hoist ?p - place)
        :precondition
            (and
                (at ?hoist ?p)
                (at ?surface ?p) ; Target surface must be at the same place
                (lifting ?hoist ?crate)
                (clear ?surface) ; Target surface must be clear
            )
        :effect
            (and
                (at ?crate ?p) ; Crate is now at the place, resting on the surface
                (available ?hoist)
                (not (lifting ?hoist ?crate))
                (on ?crate ?surface)
                (not (clear ?surface)) ; Target surface is no longer clear
                (clear ?crate) ; The crate is now on a surface and nothing is on it
            )
    )

    (:action load
        :parameters (?crate - crate ?truck - truck ?hoist - hoist ?p - place)
        :precondition
            (and
                (at ?hoist ?p)
                (at ?truck ?p)
                (lifting ?hoist ?crate) ; Hoist must be lifting the crate to load it
            )
        :effect
            (and
                (available ?hoist) ; Hoist becomes available after loading
                (not (lifting ?hoist ?crate))
                (in ?crate ?truck)
                (not (clear ?crate)) ; Crate is in truck, not a surface for stacking
            )
    )

    (:action unload
        :parameters (?crate - crate ?truck - truck ?hoist - hoist ?p - place)
        :precondition
            (and
                (at ?hoist ?p)
                (at ?truck ?p)
                (available ?hoist) ; Hoist must be available to pick up the crate from the truck
                (in ?crate ?truck)
            )
        :effect
            (and
                (not (in ?crate ?truck))
                (not (available ?hoist))
                (lifting ?hoist ?crate)
                (not (at ?crate ?p)) ; Crate is now lifted, not at the place
                (not (clear ?crate)) ; Crate is being lifted, not a surface for stacking
            )
    )
)