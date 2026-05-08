(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        locatable - object ; Common supertype for objects that have an 'at' location
        truck - locatable
        hoist - locatable
        pallet - locatable
        crate - surface ; Crates are surfaces, and their explicit location is not tracked with 'at' directly
    )

    (:predicates
        ; Objects that can be 'at' a place. Crates are handled implicitly via 'on' or 'in-truck'.
        (at ?obj - locatable ?p - place)
        (on ?c - crate ?s - surface)
        (in-truck ?c - crate ?t - truck)
        (clear ?s - surface) ; A surface is clear if nothing is on top of it
        (available ?h - hoist) ; Hoist is not currently busy
        (lifting ?h - hoist ?c - crate) ; Hoist is currently holding a crate
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
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
            (on ?c ?s) ; Crate must be on a surface
            (at ?s ?p) ; The surface (and thus the crate) must be at the same place as the hoist
            (available ?h)
            (clear ?c) ; The crate must be clear (nothing on top of it) to be lifted
        )
        :effect (and
            (not (on ?c ?s)) ; Crate is no longer on the surface
            (not (available ?h)) ; Hoist becomes busy
            (lifting ?h ?c) ; Hoist is now lifting the crate
            (clear ?s) ; The surface the crate was on is now clear
            (not (clear ?c)) ; The crate itself is no longer clear (it's being held by a hoist)
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Target surface must be at the same place as the hoist
            (clear ?s) ; Target surface must be clear to drop onto
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h) ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting
            (on ?c ?s) ; Crate is now on the surface
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; Crate is now clear (it's on top of the stack/surface)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p) ; Truck must be at the same place as the hoist
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (in-truck ?c ?t) ; Crate is now in the truck
            (available ?h) ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p) ; Truck must be at the same place as the hoist
            (available ?h) ; Hoist must be available to start the unload operation
            (in-truck ?c ?t) ; Crate must be in the truck
        )
        :effect (and
            (not (in-truck ?c ?t)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist becomes busy lifting
            (lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )
)