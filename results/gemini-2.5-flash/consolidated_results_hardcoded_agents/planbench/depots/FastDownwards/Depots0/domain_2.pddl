(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        place
        depot distributor - place
        truck
        hoist
        item
        surface - item ; Can be stacked upon (Pallets or other Crates)
        pallet - surface
        crate - surface ; Crates are the movable cargo AND stackable surfaces
    )

    (:predicates
        ;; Location tracking
        (at ?o - (either truck hoist item) ?p - place)
        (connected ?p1 - place ?p2 - place) ; Road connections

        ;; Stacking
        (on ?c - crate ?s - surface)
        (clear ?s - surface) ; The item is the top of a stack, or a free surface

        ;; Containment
        (in ?c - crate ?t - truck)

        ;; Hoist Status
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    ;; 1. DRIVE: Move a truck from one place to another place.
    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; 2. LIFT: Use a hoist to lift a crate from a surface at a place.
    (:action lift-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (not (clear ?c))        
            (not (at ?c ?p))        
            (not (on ?c ?s))        
            (lifting ?h ?c)
            (clear ?s)              
        )
    )

    ;; 3. DROP: Use a hoist to drop a crate to a surface at a place.
    (:action drop-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
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
    
    ;; 4. LOAD: Use a hoist to load a crate into a truck at a place.
    (:action load-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (in ?c ?t)
            (not (lifting ?h ?c))
        )
    )

    ;; 5. UNLOAD: Use a hoist to unload a crate from a truck at a place.
    (:action unload-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (available ?h))
            (lifting ?h ?c)
            (not (in ?c ?t))
        )
    )