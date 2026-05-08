(define (domain depots0)
    (:requirements :strips :typing :adl :negative-preconditions)

    (:types
        place ; Base type for locations where objects can be.
            depot
            distributor
        surface ; A general type for objects that can have other items placed on them, and can be clear.
            pallet ; Pallets are surfaces that can hold crates.
            crate ; Crates can be both items to be moved and surfaces for other crates.
        hoist ; Agents responsible for lifting/dropping/loading/unloading crates.
        truck ; Vehicles responsible for transporting crates between places.
    )

    (:predicates
        (at ?obj - (or hoist truck crate pallet) ?p - place) ; Location for hoists, trucks, crates, and pallets.
        (on ?c - crate ?s - surface) ; Indicates that crate ?c is resting on surface ?s.
        (in_truck ?c - crate ?t - truck) ; Indicates that crate ?c is loaded inside truck ?t.
        (clear ?s - surface) ; Indicates that surface ?s has nothing on top of it.
        (hoist_available ?h - hoist) ; Indicates that hoist ?h is not currently holding anything.
        (hoist_holding ?h - hoist ?c - crate) ; Indicates that hoist ?h is currently holding crate ?c.
    )

    ;; Action: Drive a truck from one place to another place.
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
                        (at ?t ?from)         ; The truck must be at the origin place.
                        (not (= ?from ?to))   ; The truck cannot drive to the same location.
                       )
        :effect (and
                    (not (at ?t ?from))       ; The truck is no longer at the 'from' place.
                    (at ?t ?to)               ; The truck is now at the 'to' place.
                    ; All crates currently loaded in this truck also move.
                    (forall (?c - crate)
                        (when (in_truck ?c ?t)
                            (and
                                (not (at ?c ?from)) ; Crate is no longer at the 'from' place.
                                (at ?c ?to)         ; Crate is now at the 'to' place.
                            )
                        )
                    )
                )
    )

    ;; Action: Use a hoist to lift a crate from a surface at a place.
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
                        (at ?h ?p)             ; Hoist must be at the same place as the crate.
                        (at ?c ?p)             ; Crate must be at the place.
                        (on ?c ?s)             ; Crate must be on a surface.
                        (hoist_available ?h)   ; Hoist must be available.
                        (clear ?c)             ; The crate itself must be clear to be lifted (nothing on top of it).
                       )
        :effect (and
                    (not (hoist_available ?h))   ; Hoist is no longer available.
                    (hoist_holding ?h ?c)        ; Hoist is now holding the crate.
                    (not (at ?c ?p))             ; Crate is no longer directly 'at' the place; its location is implicit with the hoist.
                    (not (on ?c ?s))             ; Crate is no longer on the surface.
                    (clear ?s)                   ; The surface it was on becomes clear.
                )
    )

    ;; Action: Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
                        (hoist_holding ?h ?c)  ; Hoist must be lifting the crate.
                        (at ?h ?p)             ; Hoist must be at the same place as the surface.
                        (at ?s ?p)             ; Target surface must be at the place.
                        (clear ?s)             ; Target surface must be clear.
                       )
        :effect (and
                    (hoist_available ?h)       ; Hoist becomes available.
                    (not (hoist_holding ?h ?c)); Hoist is no longer lifting the crate.
                    (on ?c ?s)                 ; Crate is now on the surface.
                    (at ?c ?p)                 ; Crate is now explicitly at the place (on the surface).
                    (not (clear ?s))           ; Target surface is no longer clear.
                    (clear ?c)                 ; The dropped crate itself becomes clear (nothing on it).
                )
    )

    ;; Action: Use a hoist to load a crate into a truck at a place.
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
                        (hoist_holding ?h ?c)  ; Hoist must be lifting the crate.
                        (at ?h ?p)             ; Hoist must be at the same place.
                        (at ?t ?p)             ; Truck must be at the same place.
                       )
        :effect (and
                    (hoist_available ?h)       ; Hoist becomes available.
                    (not (hoist_holding ?h ?c)); Hoist is no longer lifting the crate.
                    (in_truck ?c ?t)           ; Crate is now in the truck.
                    (at ?c ?p)                 ; Crate is now explicitly at the place (with the truck).
                )
    )

    ;; Action: Use a hoist to unload a crate from a truck at a place.
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
                        (hoist_available ?h)   ; Hoist must be available.
                        (at ?h ?p)             ; Hoist must be at the same place as the truck.
                        (at ?t ?p)             ; Truck must be at the same place.
                        (in_truck ?c ?t)       ; Crate must be in the truck.
                       )
        :effect (and
                    (not (hoist_available ?h))   ; Hoist is no longer available.
                    (hoist_holding ?h ?c)        ; Hoist is now lifting the crate.
                    (not (in_truck ?c ?t))       ; Crate is no longer in the truck.
                    (not (at ?c ?p))             ; Crate is no longer directly 'at' the place; its location is implicit with the hoist.
                )
    )
)