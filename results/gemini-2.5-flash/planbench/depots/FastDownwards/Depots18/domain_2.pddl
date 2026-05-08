(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        truck
        hoist
        depot distributor - place
        pallet crate - surface
    )

    (:predicates
        (at ?x - (either truck hoist crate pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface) ; A surface is clear if nothing is on top of it
    )

    ;; Action: Drive a truck from one place to another place.
    ;; Trucks can drive between any two depots or distributors (all places are interconnected).
    (:action drive_truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    ;; Action: Use a hoist to lift a crate from a surface at a place.
    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)         ; Hoist must be at the place
            (at ?c ?p)         ; Crate must be at the place (on the surface)
            (available ?h)     ; Hoist must be available
            (clear ?c)         ; The crate itself must be clear (nothing on top of it)
            (on ?c ?s)         ; Crate must be on the surface
        )
        :effect (and
            (not (at ?c ?p))    ; Crate is no longer resting at the place
            (lifting ?h ?c)     ; Hoist is now lifting the crate
            (not (available ?h)) ; Hoist is no longer available
            (clear ?s)          ; The surface from which the crate was lifted becomes clear
            (not (on ?c ?s))    ; Crate is no longer on the surface
        )
    )

    ;; Action: Use a hoist to drop a crate to a surface at a place.
    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)         ; Hoist must be at the place
            (at ?s ?p)         ; Target surface must be at the place
            (clear ?s)         ; Target surface must be clear to receive the crate
            (lifting ?h ?c)    ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h)      ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (at ?c ?p)          ; Crate is now resting at the place, on the surface
            (not (clear ?s))    ; Target surface is no longer clear
            (clear ?c)          ; The dropped crate's top is clear
            (on ?c ?s)          ; Crate is now on the surface
        )
    )

    ;; Action: Use a hoist to load a crate into a truck at a place.
    (:action load_crate_into_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)         ; Hoist must be at the place
            (at ?t ?p)         ; Truck must be at the place
            (lifting ?h ?c)    ; Hoist must be lifting the crate
        )
        :effect (and
            (in ?c ?t)          ; Crate is now in the truck
            (available ?h)      ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
        )
    )

    ;; Action: Use a hoist to unload a crate from a truck at a place.
    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)         ; Hoist must be at the place
            (at ?t ?p)         ; Truck must be at the place
            (available ?h)     ; Hoist must be available to perform the unload
            (in ?c ?t)         ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t))    ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist is no longer available (it's lifting)
            (lifting ?h ?c)     ; Hoist is now lifting the crate
        )
    )
)