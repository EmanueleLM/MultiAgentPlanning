(define (domain depots13)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        crate pallet - surface
        hoist truck - object
    )

    (:predicates
        (at ?x - (either truck hoist crate pallet) ?p - place)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface) ; True if nothing is on this surface
    )

    (:action drive
        :parameters (?t - truck ?from ?to - place)
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
            (at ?c ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c) ; The crate itself must be clear to be lifted
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The target surface must be at the same place
            (clear ?s) ; The target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place
            (not (clear ?s)) ; The target surface is no longer clear
            (clear ?c) ; The crate itself is now clear, as it's just been placed
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
            (available ?h)
            (not (lifting ?h ?c))
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start unloading
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h)) ; Hoist becomes busy lifting the crate
            (lifting ?h ?c)
        )
    )