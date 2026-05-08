(define (domain depots18)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        depot distributor - place
        pallet crate - surface
        truck hoist ; Top level types
    )
    (:predicates
        (at ?x - object ?p - place) ; Includes truck, hoist, crate, pallet
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
    )

    ;; 1. Drive Truck
    (:action drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and (at ?t ?p1) (not (= ?p1 ?p2)))
        :effect (and (at ?t ?p2) (not (at ?t ?p1)))
    )

    ;; 2. Lift Crate from Surface
    (:action lift-from-surface
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

    ;; 3. Drop Crate onto Surface
    (:action drop-on-surface
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

    ;; 4. Load Crate into Truck
    (:action load-truck
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

    ;; 5. Unload Crate from Truck
    (:action unload-truck
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