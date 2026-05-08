(define (domain depots33)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        hoist
        truck
        depot - place
        distributor - place
        pallet - surface
        crate - surface
    )

    (:predicates
        (at ?o - (truck hoist surface) ?l - place) ; Objects that can be at a place: trucks, hoists, and surfaces (crates, pallets)
        (on ?c - crate ?s - surface) ; A crate is on a surface (another crate or a pallet)
        (in ?c - crate ?t - truck) ; A crate is in a truck
        (available ?h - hoist) ; Hoist is free and can be used
        (lifting ?h - hoist ?c - crate) ; Hoist is currently lifting a crate
        (clear ?s - surface) ; Nothing is on top of this surface
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; The crate itself must be clear to be lifted
            (on ?c ?s) ; The crate must be on some surface
        )
        :effect (and
            (not (at ?c ?p)) ; The crate is no longer at the place, as it's being lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface the crate was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The surface must be at the same place
            (clear ?s) ; The surface must be clear to drop a crate on it
            (lifting ?h ?c) ; The hoist must be lifting the crate
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; The crate is now at the place
            (not (clear ?s)) ; The surface is no longer clear
            (clear ?c) ; The crate is now clear (nothing on top of it)
            (on ?c ?s)
        )
    )

    (:action load_crate_into_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; The hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (in ?c ?t) ; The crate is now in the truck
            ; (not (at ?c ?p)) is implicitly true as the crate is no longer being lifted at a place.
        )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t) ; The crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; The hoist is now lifting the crate
            ; (not (at ?c ?p)) is implicitly true as the crate is now being lifted.
        )
    )
)