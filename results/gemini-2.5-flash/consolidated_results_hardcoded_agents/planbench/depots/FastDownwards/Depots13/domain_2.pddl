(define (domain Depots13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        movable
        truck hoist - movable
        surface - movable
        pallet crate - surface
    )

    (:predicates
        (at ?o - movable ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
    )
    
    (:functions
        (total-cost)
    )

    ;; Drive a truck: requires truck at origin. Effect: truck leaves origin, arrives at destination.
    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (and 
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Lift a crate: requires hoist at place, crate at place, hoist available, crate clear, crate on surface.
    ;; Effect: hoist lifting crate, hoist not available, surface clear, crate not at place/not on surface.
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
            (lifting ?h ?c)
            (not (available ?h))
            (not (on ?c ?s))
            (not (at ?c ?p)) 
            (clear ?s)
            (not (clear ?c)) 
            (increase (total-cost) 1)
        )
    )

    ;; Drop a crate: requires hoist/surface at place, surface clear, hoist lifting crate. 
    ;; Effect: hoist available, crate at place, surface not clear, crate clear, crate on surface.
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
            (not (clear ?s))
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )

    ;; Load a crate: requires hoist at place, truck at place, hoist lifting crate. 
    ;; Effect: crate is in truck, hoist becomes available.
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
            (increase (total-cost) 1)
        )
    )

    ;; Unload a crate: requires hoist at place, truck at place, hoist available, crate in truck. 
    ;; Effect: crate not in truck, hoist not available, hoist lifting crate.
    (:action unload
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
)