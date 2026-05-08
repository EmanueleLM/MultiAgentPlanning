(define (domain depots5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        entity ; New common supertype for anything that can be "at" a place
        surface - entity
        pallet crate - surface
        truck - entity
        hoist - entity
    )
    (:predicates
        (at ?obj - entity, ?loc - place) ; Corrected: ?obj can be any entity
        (available ?h - hoist)
        (lifting ?h - hoist, ?c - crate)
        (clear ?s - surface)
        (on ?c - crate, ?s - surface)
        (in ?c - crate, ?t - truck)
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
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place directly
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
            (at ?s ?p) ; surface must be at the place to drop on it
            (clear ?s) ; The surface must be clear to drop something on it
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now 'at' the place again
            (not (clear ?s)) ; The surface is no longer clear
            (clear ?c) ; The top of the crate is clear
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
            (available ?h)
            ; Note: crate is not 'at' place or 'on' surface once loaded into truck
            ; Its 'clear' status as a surface is irrelevant when inside a truck
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            ; Crate is not 'at' place until dropped
        )
    )
)