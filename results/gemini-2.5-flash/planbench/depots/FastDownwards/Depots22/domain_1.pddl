(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )

    (:predicates
        (at ?o - (truck hoist crate pallet) ?p - place)
        (available ?h - hoist)
        (clear ?s - surface) ; A surface (pallet or crate) is clear if nothing is on it and it's stationary.
        (lifting ?h - hoist ?c - crate)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (= ?from ?to))
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
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place directly, it's being lifted.
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear.
            (not (on ?c ?s))
            (not (clear ?c)) ; Crate is no longer clear as it's being lifted/moved.
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Surface must be at the place to drop onto.
            (clear ?s) ; Surface must be clear to receive a crate.
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place.
            (not (clear ?s)) ; Surface is no longer clear.
            (clear ?c) ; Crate becomes clear after being dropped.
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
            (available ?h) ; Hoist becomes available after loading.
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start unloading.
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (not (clear ?c)) ; Crate is no longer clear as it's being lifted/moved.
        )
    )
)