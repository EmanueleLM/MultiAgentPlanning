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
        (at ?obj - (truck hoist surface) ?loc - place)
        (available ?hoist - hoist)
        (lifting ?hoist - hoist ?crate - crate)
        (clear ?surface - surface) ; True if nothing is on this surface
        (on ?crate - crate ?surface - surface) ; ?crate is on top of ?surface
        (in ?crate - crate ?truck - truck) ; ?crate is inside ?truck
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive)
        (:parameters (?truck - truck ?from - place ?to - place))
        (:precondition
            (and
                (at ?truck ?from)
                (connected ?from ?to)
                (not (= ?from ?to)) ; Truck must move to a different place
            )
        )
        (:effect
            (and
                (not (at ?truck ?from))
                (at ?truck ?to)
            )
        )

    (:action lift)
        (:parameters (?crate - crate ?surface - surface ?hoist - hoist ?p - place))
        (:precondition
            (and
                (at ?hoist ?p)
                (at ?crate ?p)
                (at ?surface ?p) ; The surface must also be at the same place
                (available ?hoist)
                (on ?crate ?surface)
                (clear ?crate) ; Nothing on the crate being lifted
            )
        )
        (:effect
            (and
                (not (at ?crate ?p))
                (not (available ?hoist))
                (lifting ?hoist ?crate)
                (not (on ?crate ?surface))
                (clear ?surface) ; The surface below is now clear
                (not (clear ?crate)) ; The crate is now lifted, so it's not "clear" in the stacking sense
            )
        )

    (:action drop)
        (:parameters (?crate - crate ?surface - surface ?hoist - hoist ?p - place))
        (:precondition
            (and
                (at ?hoist ?p)
                (at ?surface ?p) ; Target surface must be at the same place
                (lifting ?hoist ?crate)
                (clear ?surface) ; Target surface must be clear
            )
        )
        (:effect
            (and
                (at ?crate ?p)
                (available ?hoist)
                (not (lifting ?hoist ?crate))
                (on ?crate ?surface)
                (not (clear ?surface)) ; Target surface is no longer clear
                (clear ?crate) ; The crate is now on a surface and nothing is on it
            )
        )

    (:action load)
        (:parameters (?crate - crate ?truck - truck ?hoist - hoist ?p - place))
        (:precondition
            (and
                (at ?hoist ?p)
                (at ?truck ?p)
                (lifting ?hoist ?crate)
            )
        )
        (:effect
            (and
                (available ?hoist)
                (not (lifting ?hoist ?crate))
                (in ?crate ?truck)
                (not (clear ?crate)) ; Crate is in truck, no longer "clear" in the stacking sense
            )
        )

    (:action unload)
        (:parameters (?crate - crate ?truck - truck ?hoist - hoist ?p - place))
        (:precondition
            (and
                (at ?hoist ?p)
                (at ?truck ?p)
                (available ?hoist) ; Hoist must be available to unload
                (in ?crate ?truck)
            )
        )
        (:effect
            (and
                (not (in ?crate ?truck))
                (not (available ?hoist))
                (lifting ?hoist ?crate)
                (not (at ?crate ?p)) ; Crate is now lifted, not at the place
                (not (clear ?crate)) ; Crate is being lifted, not "clear" in the stacking sense
            )
        )
)