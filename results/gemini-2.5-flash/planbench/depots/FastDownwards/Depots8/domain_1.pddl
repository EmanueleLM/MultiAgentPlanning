(define (domain depots8)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        hoist - object
        truck - object
    )

    (:predicates
        (at ?obj - (or truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
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

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place on a surface
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Surface must be at the same place
            (clear ?s) ; Surface must be clear to drop onto
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now 'at' the place, on a surface
            (not (clear ?s)) ; Surface is no longer clear
            (clear ?c) ; Crate itself is clear
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
            ; (not (at ?c ?p)) is already true from lift_crate
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?c) ; Crate is clear when lifted
            ; (not (at ?c ?p)) remains true until dropped
        )
    )
)