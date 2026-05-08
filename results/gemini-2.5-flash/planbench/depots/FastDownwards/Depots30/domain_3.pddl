(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at ?obj - (either truck hoist surface) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (on ?c - crate ?s - surface)
        (in-truck ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place once lifted
            (not (on ?c ?s))
            (not (available ?h))
            (clear ?s) ; The surface it was on is now clear
            (lifting ?h ?c)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (lifting ?h ?c)
            (clear ?s) ; The surface to drop onto must be clear
        )
        :effect (and
            (not (lifting ?h ?c))
            (not (clear ?s)) ; The surface is no longer clear
            (available ?h)
            (at ?c ?p) ; Crate is now 'at' the place, resting on surface
            (on ?c ?s)
            (clear ?c) ; The crate itself is clear after being dropped
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (not (at ?c ?p)) ; Crate is no longer 'at' the place (it's in the truck)
            (available ?h) ; Hoist becomes available
            (in-truck ?c ?t)
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to unload
            (in-truck ?c ?t)
        )
        :effect (and
            (not (in-truck ?c ?t))
            (not (available ?h)) ; Hoist is no longer available (it's lifting)
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; Note: (at ?c ?p) is NOT added here because the crate is being lifted by the hoist.
            ; It will become (at ?c ?p) when subsequently dropped onto a surface.
        )
    )