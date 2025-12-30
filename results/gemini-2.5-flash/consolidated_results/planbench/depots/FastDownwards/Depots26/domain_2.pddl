(define (domain depots26)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )
    
    (:predicates
        (at ?x - object ?p - place)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and 
            (at ?t ?from)
            (not (= ?from ?to))
        )
        :effect (and 
            (at ?t ?to) 
            (not (at ?t ?from))
        )
    )

    (:action lift-crate-from-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) 
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and 
            (not (at ?c ?p)) 
            (lifting ?h ?c) 
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
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
        )
    )

    (:action load-crate-onto-truck
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
        )
    )
)