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
        (at ?x - (truck hoist crate pallet) ?p - place)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface) ; True if nothing is on ?s
        (on ?c - crate ?s - surface) ; ?c is stacked on ?s
    )

    ;; Action: Drive a truck from one place to another place.
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

    ;; Action: Use a hoist to lift a crate from a surface at a place.
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
            (clear ?s) ; Surface S becomes clear
            (not (on ?c ?s))
        )
    )
    
    ;; Action: Use a hoist to drop a crate to a surface at a place.
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

    ;; Action: Use a hoist to load a crate into a truck at a place.
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

    ;; Action: Use a hoist to unload a crate from a truck at a place.
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