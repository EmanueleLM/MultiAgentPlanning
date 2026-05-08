(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck hoist
    )
    
    (:predicates
        (at ?o - (either truck hoist surface) ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )
    
    (:functions (total-cost))

    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and 
            (at ?t ?to)
            (not (at ?t ?from))
            (increase (total-cost) 1)
        )
    )

    (:action lift-crate-from-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
            (available ?h)
        )
        :effect (and
            (lifting ?h ?c)
            (clear ?s)
            (not (available ?h)) 
            (not (at ?c ?p))
            (not (on ?c ?s)) 
            (increase (total-cost) 1)
        )
    )

    (:action drop-crate-to-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) 
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c)) 
            (at ?c ?p)
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
            (increase (total-cost) 1)
        )
    )

    (:action load-crate-to-truck
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
            (increase (total-cost) 1)
        )
    )
    
    (:action unload-crate-from-truck
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
            (increase (total-cost) 1)
        )
    )