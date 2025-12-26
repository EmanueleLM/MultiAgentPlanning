(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions)
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

    ;; 1. Drive a truck
    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and 
            (at ?t ?to)
            (not (at ?t ?from))
        )
    )

    ;; 2. Use a hoist to lift a crate from a surface 
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
        )
    )

    ;; 3. Use a hoist to drop a crate to a surface
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

    ;; 4. Use a hoist to load a crate into a truck
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
        )
    )
    
    ;; 5. Use a hoist to unload a crate from a truck
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