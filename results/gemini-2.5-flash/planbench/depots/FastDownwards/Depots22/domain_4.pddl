(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        locatable - object
        surface - locatable
        pallet crate - surface
        truck - locatable
        hoist - locatable
    )

    (:predicates
        (at ?o - locatable ?p - place) ; For crates, this means resting at the place. For trucks/hoists/pallets, it's their location.
        (available ?h - hoist)
        (clear ?s - surface) ; True if nothing is on top of surface ?s
        (lifting ?h - hoist ?c - crate) ; Hoist ?h is currently holding crate ?c
        (on ?c - crate ?s - surface) ; Crate ?c is resting on surface ?s
        (in ?c - crate ?t - truck) ; Crate ?c is inside truck ?t
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p) ; Crate must be resting at the place
            (available ?h)
            (clear ?c) ; Crate must have nothing on it to be lifted
            (on ?c ?s) ; Crate must be on a surface to be lifted from it
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer resting at the place
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s)) ; Crate is no longer on the surface
            ; (not (clear ?c)) removed: A lifted crate is still "clear" (nothing on top of it)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; Surface to drop onto must be clear
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now resting at the place
            (not (clear ?s)) ; Surface is no longer clear
            (clear ?c) ; Crate is clear (nothing on it)
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (in ?c ?t) ; Crate is now in the truck
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (available ?h) ; Hoist becomes available
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform the unload
            (in ?c ?t) ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist becomes unavailable
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; (not (clear ?c)) removed: An unloaded crate (now lifted) is still "clear"
        )
    )
)