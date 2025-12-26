(define (domain depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        truck - object
        hoist - object
        surface - object
        pallet - surface
        crate - surface
    )

    (:predicates
        ;; Location predicates
        (at ?obj - object ?p - place)
        
        ;; Hoist state
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)

        ;; Container state (Truck/Crate)
        (in ?c - crate ?t - truck)

        ;; Surface state (Stacking)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. DRIVE: Move a truck between two places.
    (:action drive
        :parameters (?t - truck ?p1 ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (not (at ?t ?p2))
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    ;; 2. LIFT: Lift a crate from a surface using a hoist.
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
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (not (clear ?c)) 
            (clear ?s)
            (not (on ?c ?s))
            (increase (total-cost) 1)
        )
    )

    ;; 3. DROP: Drop a crate held by a hoist onto a clear surface.
    (:action drop
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
            (increase (total-cost) 1)
        )
    )

    ;; 4. LOAD: Load a lifted crate onto a truck using a hoist.
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (in ?c ?t)
            (increase (total-cost) 1)
        )
    )

    ;; 5. UNLOAD: Unload a crate from a truck using a hoist.
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