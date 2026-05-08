(define (domain depots_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        hoist
        truck
        depot distributor - place
        pallet crate - surface
    )
    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?p - place) ; Object location
        (on ?c - crate ?s - surface) ; Crate C is on surface S
        (clear ?s - surface) ; Surface S has nothing on it
        (available ?h - hoist) ; Hoist H is available
        (lifting ?h - hoist ?c - crate) ; Hoist H is lifting crate C
        (in ?c - crate ?t - truck) ; Crate C is inside truck T
        (connected ?from - place ?to - place) ; Places are connected
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
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
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; Crate C must be clear to be lifted (nothing on it)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at P (it's lifted)
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface S is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The surface S must be at the place P
            (clear ?s) ; The surface S must be clear to drop C on it
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at P
            (not (clear ?s)) ; Surface S is no longer clear
            (clear ?c) ; Crate C itself is clear (nothing on top of it)
            (on ?c ?s)
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
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (not (at ?c ?p)) ; Crate is no longer "at" P (it's inside truck)
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start unloading
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            ; (at ?c ?p) ; Removed: Crate is now lifted, not "at" the place in the same sense as on a surface.
            (clear ?c) ; Crate C is clear (no other crate on it)
        )
    )