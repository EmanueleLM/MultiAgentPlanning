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
        (at ?obj - (either truck hoist crate pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface) ; nothing on top of this surface
        (available ?h - hoist) ; hoist is not lifting anything
        (lifting ?h - hoist ?c - crate) ; hoist is lifting a crate
        (in ?c - crate ?t - truck) ; crate is inside a truck
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (at ?t ?to)) ; A truck cannot be at two distinct places simultaneously
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
            (at ?c ?p)         ; Crate must be on a surface at this place
            (available ?h)
            (clear ?c)          ; Crate must be clear to be lifted
            (on ?c ?s)          ; Crate must be on a surface
        )
        :effect (and
            (not (on ?c ?s))    ; Crate is no longer on the surface
            (not (at ?c ?p))    ; Crate is lifted, no longer "at" the place in terms of being on a surface
            (lifting ?h ?c)     ; Hoist is now lifting the crate
            (not (available ?h)) ; Hoist is no longer available
            (clear ?s)          ; The surface the crate was on becomes clear
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)          ; Surface must be at the same place
            (clear ?s)          ; Target surface must be clear
            (lifting ?h ?c)     ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h)      ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (at ?c ?p)          ; Crate is now at the place, on a surface
            (not (clear ?s))    ; The surface is no longer clear
            (clear ?c)          ; The dropped crate itself is clear
            (on ?c ?s)          ; Crate is placed on the surface
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)          ; Truck must be at the same place
            (lifting ?h ?c)     ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (available ?h)      ; Hoist becomes available
            (in ?c ?t)          ; Crate is now in the truck
            ; (not (at ?c ?p))   ; Crate remains not "at" the place on a surface
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)          ; Truck must be at the same place
            (available ?h)      ; Hoist must be available
            (in ?c ?t)          ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t))    ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist is no longer available
            (lifting ?h ?c)     ; Hoist is now lifting the crate
            ; (not (at ?c ?p))   ; Crate remains not "at" the place on a surface
        )
    )