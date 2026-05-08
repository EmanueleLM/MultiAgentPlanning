(define (domain depots28)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        depot distributor - place
        truck
        hoist
        surface
        pallet crate - surface
    )
    (:predicates
        (at ?o - (either truck hoist crate pallet) ?p - place)
        (on ?c - crate ?s - surface) ; Changed type to parent 'surface'
        (clear ?s - surface) ; Changed type to parent 'surface'
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
    )
    (:functions
        (total-cost)
    )

    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (at ?t ?from)
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    (:action lift
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
        :precondition (and
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
            (at ?h ?p)
            (available ?h)
        )
        :effect (and
            (not (on ?c ?s))
            (not (clear ?c))
            (not (available ?h))
            (clear ?s)
            (lifting ?h ?c)
            (not (at ?c ?p)) ; Crate is not "at" the place when lifted
            (increase (total-cost) 1)
        )
    )

    (:action drop
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (clear ?s)
            (at ?s ?p)
            (at ?h ?p)
        )
        :effect (and
            (not (lifting ?h ?c))
            (not (clear ?s))
            (available ?h)
            (on ?c ?s)
            (clear ?c)
            (at ?c ?p) ; Crate is "at" the place when dropped on a surface
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?t ?p)
            (at ?h ?p)
        )
        :effect (and
            (not (lifting ?h ?c))
            (not (at ?c ?p)) ; Crate is no longer "at" the place, it's inside the truck
            (in ?c ?t)
            (available ?h)
            (increase (total-cost) 1)
        )
    )

    (:action unload
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and
            (in ?c ?t)
            (at ?t ?p)
            (available ?h)
            (at ?h ?p)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            ;(at ?c ?p) ; REMOVED: Crate is now lifted by hoist, not "at" the place.
            (increase (total-cost) 1)
        )
    )
)