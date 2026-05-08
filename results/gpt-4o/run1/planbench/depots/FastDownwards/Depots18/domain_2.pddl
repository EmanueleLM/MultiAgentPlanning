(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        place
        surface
        truck
        hoist
        crate
        pallet - surface
    )
    (:predicates
        (at ?x - (either truck hoist) ?p - place)
        (at-crate ?c - crate ?p - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
    )
    
    (:action Drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and (at ?t ?from))
        :effect (and (not (at ?t ?from)) (at ?t ?to))
    )
    
    (:action Lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (at ?h ?p)
            (at-crate ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and 
            (lifting ?h ?c)
            (clear ?s)
            (not (available ?h))
            (not (on ?c ?s))
            (not (at-crate ?c ?p))
        )
    )
    
    (:action Drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (at ?h ?p)
            (lifting ?h ?c)
            (clear ?s)
        )
        :effect (and 
            (not (lifting ?h ?c))
            (on ?c ?s)
            (clear ?c)
            (not (clear ?s))
            (available ?h)
            (at-crate ?c ?p)
        )
    )
    
    (:action Load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and 
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and 
            (not (lifting ?h ?c))
            (in ?c ?t)
            (available ?h)
        )
    )
    
    (:action Unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and 
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
            (available ?h)
        )
        :effect (and 
            (not (in ?c ?t))
            (lifting ?h ?c)
            (not (available ?h))
            (at-crate ?c ?p)
        )
    )
)