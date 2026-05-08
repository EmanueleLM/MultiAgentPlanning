(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        locatable
        surface
        truck - locatable
        hoist - locatable
        pallet - (and locatable surface)
        crate - (and locatable surface) ; Crates are now locatable and surfaces
    )

    (:predicates
        (at ?obj - locatable ?p - place) ; Tracks location for trucks, hoists, pallets, and crates (when not in truck/lifting)
        (on ?c - crate ?s - surface) ; Crate ?c is on surface ?s
        (in-truck ?c - crate ?t - truck) ; Crate ?c is inside truck ?t
        (clear ?s - surface) ; Surface ?s has nothing on it
        (available ?h - hoist) ; Hoist ?h is not busy
        (lifting ?h - hoist ?c - crate) ; Hoist ?h is currently lifting crate ?c
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
            (at ?c ?p)          ; Crate's location must match hoist's
            (on ?c ?s)          ; Crate must be on a surface
            (at ?s ?p)          ; Supporting surface must be at the same place (now valid for crates and pallets)
            (available ?h)
            (clear ?c)          ; Crate must be clear to be lifted
        )
        :effect (and
            (not (on ?c ?s))
            (not (at ?c ?p))     ; Crate is lifted, no longer at this place (it's in the air)
            (not (available ?h)) ; Hoist becomes busy
            (lifting ?h ?c)      ; Hoist is now lifting the crate
            (clear ?s)           ; The surface the crate was on is now clear
            (not (clear ?c))     ; The crate itself is no longer clear as it's being held
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)          ; Target surface must be at the same place as the hoist
            (clear ?s)          ; Target surface must be clear to drop onto
            (lifting ?h ?c)     ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h)       ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting
            (on ?c ?s)           ; Crate is now on the surface
            (at ?c ?p)           ; Crate is dropped, now at this place
            (not (clear ?s))     ; Target surface is no longer clear
            (clear ?c)           ; Crate is now clear (it's on top of the stack/surface)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)          ; Truck must be at the same place as the hoist
            (lifting ?h ?c)     ; Hoist must be lifting the crate (implies (not (at ?c ?p)))
        )
        :effect (and
            (in-truck ?c ?t)     ; Crate is now in the truck
            ; (at ?c ?p) is implicitly removed when lifting, and remains absent while in-truck.
            (available ?h)       ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)          ; Truck must be at the same place as the hoist
            (available ?h)       ; Hoist must be available to start the unload operation
            (in-truck ?c ?t)     ; Crate must be in the truck (implies (not (at ?c ?p)))
        )
        :effect (and
            (not (in-truck ?c ?t)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist becomes busy lifting
            (lifting ?h ?c)      ; Hoist is now lifting the crate (implies (not (at ?c ?p)))
        )
    )
)