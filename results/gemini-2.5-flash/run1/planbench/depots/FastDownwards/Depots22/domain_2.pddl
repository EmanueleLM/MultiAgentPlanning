(define (domain depots22)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot - place
        distributor - place
        surface
        pallet - surface
        crate - surface
        truck
        hoist
    )

    (:predicates
        (at ?o - (either truck hoist crate pallet) ?p - place) ; Locatable objects: trucks, hoists, crates, pallets
        (available ?h - hoist) ; Hoist is not currently lifting anything
        (clear ?s - surface) ; The top of surface ?s is clear (nothing is on it)
        (lifting ?h - hoist ?c - crate) ; Hoist ?h is currently lifting crate ?c
        (on ?c - crate ?s - surface) ; Crate ?c is on top of surface ?s
        (in ?c - crate ?t - truck) ; Crate ?c is inside truck ?t
    )

    (:action drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; The surface must also be at the same place
            (available ?h)
            (clear ?c) ; The top of the crate must be clear to be lifted
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer directly at the place (it's being lifted)
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Target surface must be at the same place
            (clear ?s) ; Target surface must be clear to drop onto
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; Crate's top is clear (as nothing is on it after being dropped)
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h) ; Hoist is now available after loading
            (not (at ?c ?p)) ; Crate is now inside the truck, not 'at' the place directly
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform the unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; (not (at ?c ?p)) ; This is redundant, as a crate that is 'in' a truck or 'lifting' is already (not (at ?c ?p))
        )
    )
)