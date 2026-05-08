(define (domain depots)
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
        (at_truck ?t - truck ?p - place)
        (at_hoist ?h - hoist ?p - place)
        (at_surface ?s - surface ?p - place) ; For pallets and crates
        (on ?c - crate ?s - surface)
        (clear ?s - surface) ; nothing on top of this surface
        (available ?h - hoist) ; hoist is not lifting anything
        (lifting ?h - hoist ?c - crate) ; hoist is lifting a crate
        (in ?c - crate ?t - truck) ; crate is inside a truck
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at_truck ?t ?from)
        )
        :effect (and
            (not (at_truck ?t ?from))
            (at_truck ?t ?to)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_surface ?c ?p)         ; Crate must be on a surface at this place
            (available ?h)
            (clear ?c)                  ; Crate must be clear to be lifted
            (on ?c ?s)                  ; Crate must be on a surface
        )
        :effect (and
            (not (on ?c ?s))            ; Crate is no longer on the surface
            (not (at_surface ?c ?p))    ; Crate is lifted, no longer "at" the place in terms of being on a surface
            (lifting ?h ?c)             ; Hoist is now lifting the crate
            (not (available ?h))        ; Hoist is no longer available
            (clear ?s)                  ; The surface the crate was on becomes clear
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_surface ?s ?p)          ; Surface must be at the same place
            (clear ?s)                  ; Target surface must be clear
            (lifting ?h ?c)             ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h)              ; Hoist becomes available
            (not (lifting ?h ?c))       ; Hoist is no longer lifting the crate
            (at_surface ?c ?p)          ; Crate is now at the place, on a surface
            (not (clear ?s))            ; The surface is no longer clear
            (clear ?c)                  ; The dropped crate itself is clear
            (on ?c ?s)                  ; Crate is placed on the surface
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)            ; Truck must be at the same place
            (lifting ?h ?c)             ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c))       ; Hoist is no longer lifting the crate
            (available ?h)              ; Hoist becomes available
            (in ?c ?t)                  ; Crate is now in the truck
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_hoist ?h ?p)
            (at_truck ?t ?p)            ; Truck must be at the same place
            (available ?h)              ; Hoist must be available
            (in ?c ?t)                  ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t))            ; Crate is no longer in the truck
            (not (available ?h))        ; Hoist is no longer available
            (lifting ?h ?c)             ; Hoist is now lifting the crate
        )
    )
)