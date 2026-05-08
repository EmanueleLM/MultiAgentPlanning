(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        truck
        hoist
        crate - surface
        pallet - surface
    )

    (:predicates
        ; Fixed: Using 'either' for multiple types.
        ; Crates do not have a direct 'at' predicate; their location is implied by 'on' or 'in-truck'.
        (at ?obj - (either truck hoist pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (in-truck ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            ; Crates in the truck are implicitly moved with the truck.
            ; Their 'at' location is derived from (in-truck ?c ?t) and (at ?t ?to).
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (on ?c ?s)
            (at ?s ?p) ; Implies crate is at place ?p
            (available ?h)
            (clear ?c) ; Crate must be clear to be lifted from on top
        )
        :effect (and
            (not (on ?c ?s))
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s) ; The surface it was on is now clear
            (not (clear ?c)) ; The crate itself is no longer clear (it's being held)
            ; "crate is not at the place" is interpreted as no longer resting on a surface at that place.
            ; Crate is still physically at ?p, being held by hoist.
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; Target surface must be clear to drop onto
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (on ?c ?s)
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; Crate is now clear (it's on top of a stack)
            ; "crate is at the place" is consistent with (on ?c ?s) and (at ?s ?p).
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in-truck ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            ; Crate remains (not (clear ?c)) as it's inside the truck and not directly stackable.
            ; Human specification for effects was truncated, inferring standard behaviour.
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start the unload operation
            (in-truck ?c ?t)
        )
        :effect (and
            (not (in-truck ?c ?t))
            (not (available ?h)) ; Hoist becomes busy lifting
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; Crate remains (not (clear ?c)) as it is now being lifted.
        )
    )
)