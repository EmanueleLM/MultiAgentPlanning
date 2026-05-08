(define (domain depots-domain)
(:requirements :strips :typing :negative-preconditions :action-costs)

(:types
    place - object
    depot distributor - place
    hoist - object
    surface - object
    static-surface - surface
    vehicle-surface - surface
    pallet crate - static-surface
    truck - vehicle-surface
)

(:predicates
    (at ?x - (either pallet crate truck hoist) ?p - place)
    (available ?h - hoist)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (lifting ?h - hoist ?c - crate)
)

(:functions
    (total-cost) - number
)

;; ---------------------- 1. Truck Movement ----------------------
(:action DRIVE
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and 
        (at ?t ?p1)
        (not (= ?p1 ?p2))
    )
    :effect (and
        (not (at ?t ?p1))
        (at ?t ?p2)
        (increase (total-cost) 1)
    )
)

;; ---------------------- 2. Cargo Handling (Static Stacking) ----------------------

; LIFT: Crate from static surface (pallet/crate) to hoist
(:action LIFT
    :parameters (?p - place ?h - hoist ?c - crate ?s - static-surface)
    :precondition (and
        (at ?h ?p) (at ?c ?p) (at ?s ?p)
        (available ?h)
        (on ?c ?s)
        (clear ?c)
    )
    :effect (and
        (not (available ?h))
        (lifting ?h ?c)
        (not (on ?c ?s))
        (not (clear ?c))
        (clear ?s)
        (increase (total-cost) 1)
    )
)

; DROP: Crate from hoist to static surface (pallet/crate)
(:action DROP
    :parameters (?p - place ?h - hoist ?c - crate ?s - static-surface)
    :precondition (and
        (at ?h ?p) (at ?s ?p)
        (lifting ?h ?c)
        (clear ?s)
    )
    :effect (and
        (available ?h)
        (not (lifting ?h ?c))
        (on ?c ?s)
        (clear ?c)
        (not (clear ?s))
        (increase (total-cost) 1)
    )
)

;; ---------------------- 3. Cargo Handling (Truck Interaction) ----------------------

; UNLOAD: Crate from truck to hoist
(:action UNLOAD
    :parameters (?p - place ?h - hoist ?c - crate ?t - truck)
    :precondition (and
        (at ?h ?p) (at ?t ?p) (at ?c ?p)
        (available ?h)
        (on ?c ?t)
        (clear ?c)
    )
    :effect (and
        (not (available ?h))
        (lifting ?h ?c)
        (not (on ?c ?t))
        (not (clear ?c))
        (clear ?t)
        (increase (total-cost) 1)
    )
)

; LOAD: Crate from hoist to truck
(:action LOAD
    :parameters (?p - place ?h - hoist ?c - crate ?t - truck)
    :precondition (and
        (at ?h ?p) (at ?t ?p)
        (lifting ?h ?c)
        (clear ?t)
    )
    :effect (and
        (available ?h)
        (not (lifting ?h ?c))
        (on ?c ?t)
        (clear ?c)
        (not (clear ?t))
        (increase (total-cost) 1)
    )
)
)