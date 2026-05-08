(define (domain depots7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface) ; a surface is clear if nothing is on it
        (on ?c - crate ?s - surface) ; ?c is on ?s
        (lifting ?h - hoist ?c - crate) ; hoist is lifting crate
        (in ?c - crate ?t - truck) ; crate is inside truck
    )

    ;; Action: Drive truck from one place to another
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

    ;; Action: Use a hoist to lift a crate from a surface at a place
    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; Surface must be at the same place
            (available ?h)
            (clear ?c) ; Crate must be clear (nothing on it)
            (on ?c ?s) ; Crate must be on the surface
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place (it's being lifted)
            (lifting ?h ?c) ; Hoist is now lifting the crate
            (not (available ?h)) ; Hoist is no longer available
            (clear ?s) ; The surface the crate was on is now clear
            (not (on ?c ?s)) ; Crate is no longer on the surface
            (not (clear ?c)) ; Crate is no longer clear (it's being lifted)
        )
    )

    ;; Action: Use a hoist to drop a crate to a surface at a place
    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Surface must be at the same place
            (clear ?s) ; Target surface must be clear
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h) ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist stops lifting the crate
            (at ?c ?p) ; Crate is now at the place
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; Crate is clear once dropped
            (on ?c ?s) ; Crate is now on the surface
        )
    )

    ;; Action: Use a hoist to load a crate into a truck at a place
    ;; Note: Human specification for effects was truncated. Inferred based on typical logistics.
    (:action load_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (available ?h) ; Hoist becomes available
            (not (lifting ?h ?c)) ; Hoist stops lifting the crate
            (in ?c ?tr) ; Crate is now in the truck
            (not (at ?c ?p)) ; Crate is no longer at the place
            (not (clear ?c)) ; Crate is not clear when loaded into a truck
        )
    )

    ;; Action: Use a hoist to unload a crate from a truck at a place
    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (available ?h) ; Hoist must be available to pick up from truck
            (in ?c ?tr) ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?tr)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist is no longer available (it's lifting)
            (lifting ?h ?c) ; Hoist is now lifting the crate
            (not (clear ?c)) ; Crate is not clear when lifted from a truck
        )
    )
)