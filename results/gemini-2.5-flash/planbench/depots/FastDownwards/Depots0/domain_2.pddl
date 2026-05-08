(define (domain logistics-depot-combined)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot - place
        distributor - place
        surface
        pallet - surface
        crate - surface ; A crate can be a surface for another crate, and also an item to be moved
        truck
        hoist
    )

    (:predicates
        ;; General location of objects (trucks, hoists, crates, pallets) at a place
        (at ?o - (either truck hoist crate pallet) ?p - place)
        
        ;; Stacking relationship: ?c is on top of ?s
        (on ?c - crate ?s - surface)
        
        ;; Clearness: ?s has nothing on top of it
        (clear ?s - surface)
        
        ;; Crate inside a truck
        (in_truck ?c - crate ?t - truck)
        
        ;; Hoist availability
        (hoist_available ?h - hoist)
        
        ;; Hoist lifting a specific crate
        (hoist_lifting ?h - hoist ?c - crate)
        
        ;; Road connectivity between places
        (connected ?from ?to - place)
    )

    ;; Action: Drive a truck from one place to another place.
    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; Action: Use a hoist to lift a crate from a surface at a place.
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)           ; Hoist must be at the place
            (at ?c ?p)           ; Crate must be at the place
            (on ?c ?s)           ; Crate must be on the specified surface
            (hoist_available ?h) ; Hoist must be free
            (clear ?c)           ; Crate itself must be clear to be lifted
        )
        :effect (and
            (not (hoist_available ?h))
            (hoist_lifting ?h ?c)
            (not (at ?c ?p))     ; Crate is no longer at the place (it's lifted)
            (not (on ?c ?s))     ; Crate is no longer on the surface
            (clear ?s)           ; The surface it was on is now clear
        )
    )

    ;; Action: Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)           ; Hoist must be at the place
            (at ?s ?p)           ; Target surface must be at the place
            (hoist_lifting ?h ?c) ; Hoist must be lifting the crate
            (clear ?s)           ; Target surface must be clear
        )
        :effect (and
            (hoist_available ?h)
            (not (hoist_lifting ?h ?c))
            (at ?c ?p)           ; Crate is now at the place on the ground/surface
            (on ?c ?s)           ; Crate is now on the surface
            (not (clear ?s))     ; Target surface is no longer clear
            (clear ?c)           ; Crate itself is clear after being dropped (nothing on top of it)
        )
    )

    ;; Action: Use a hoist to load a crate into a truck at a place.
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)           ; Hoist must be at the place
            (at ?t ?p)           ; Truck must be at the place
            (hoist_lifting ?h ?c) ; Hoist must be lifting the crate
            ;; (not (in_truck ?c ?t)) ; This is implied by (hoist_lifting ?h ?c) if a crate can only be in one state.
                                  ; Adding it doesn't hurt, but the current problem doesn't need it.
        )
        :effect (and
            (not (hoist_lifting ?h ?c))
            (hoist_available ?h)
            (in_truck ?c ?t)
        )
    )

    ;; Action: Use a hoist to unload a crate from a truck at a place.
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)           ; Hoist must be at the place
            (at ?t ?p)           ; Truck must be at the place
            (hoist_available ?h) ; Hoist must be available to pick up the crate
            (in_truck ?c ?t)     ; Crate must be in the truck
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (hoist_available ?h))
            (hoist_lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )
)