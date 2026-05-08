(define (domain Depots7)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place surface
        depot distributor - place
        pallet crate - surface
        truck hoist
    )
    (:predicates
        (at ?obj - object ?loc - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (holding ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )
    (:functions
        (total-cost)
    )

    ;; Action: Drive a truck from one place to another
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Lift a crate from a surface using a hoist
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p)
            (available ?h)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (on ?c ?s))
            (clear ?s)
            (not (clear ?c))
            (not (at ?c ?p))
            (increase (total-cost) 1)
        )
    )

    ;; Action: Drop a crate onto a surface using a hoist
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (holding ?h ?c)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
            (at ?c ?p)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Load a crate from a hoist into a truck
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (holding ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (in ?c ?t)
            (not (clear ?c))
            (increase (total-cost) 1)
        )
    )

    ;; Action: Unload a crate from a truck into a hoist
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (in ?c ?t))
            (not (clear ?c))
            (increase (total-cost) 1)
        )
    )
)