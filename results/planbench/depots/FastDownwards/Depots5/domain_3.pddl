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
;; DRIVE_EMPTY: A truck can drive when empty.
(:action DRIVE_EMPTY
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and 
        (at ?t ?p1)
        (clear ?t) ; Truck must be empty (clear deck)
        (not (= ?p1 ?p2))
    )
    :effect (and
        (not (at ?t ?p1))
        (at ?t ?p2)
        (increase (total-cost) 1)
    )
)

;; DRIVE_CARGO: A truck can drive when carrying a single, self-contained cargo unit ?c.
;; This action enforces that the location of the cargo moves with the truck.
(:action DRIVE_CARGO
    :parameters (?t - truck ?p1 - place ?p2 - place ?c - crate)
    :precondition (and 
        (at ?t ?p1)
        (at ?c ?p1) ; Crate must be at origin location
        (on ?c ?t)   ; Crate C must be loaded onto the truck T
        (clear ?c)   ; Crate C must be the topmost item of its stack for simplified movement
        (not (= ?p1 ?p2))
    )
    :effect (and
        (not (at ?t ?p1))
        (at ?t ?p2)
        (not (at ?c ?p1))
        (at ?c ?p2)
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
        (not (at ?c ?p)) ; Crate location removed when lifted
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
        (at ?c ?p) ; Crate location set when dropped
        (increase (total-cost) 1)
    )
)

;; ---------------------- 3. Cargo Handling (Truck Interaction) ----------------------

; UNLOAD: Crate from truck to hoist (Lift from truck surface)
(:action UNLOAD
    :parameters (?p - place ?h - hoist ?c - crate ?t - truck)
    :precondition (and
        (at ?h ?p) (at ?t ?p) (at ?c ?p)
        (available ?h)
        (on ?c ?t)
        (clear ?c) ; Must be the topmost item in the stack on the truck
    )
    :effect (and
        (not (available ?h))
        (lifting ?h ?c)
        (not (on ?c ?t))
        (not (clear ?c))
        (clear ?t)
        (not (at ?c ?p)) ; Crate location removed when lifted
        (increase (total-cost) 1)
    )
)

; LOAD: Crate from hoist to truck (Drop onto truck surface)
(:action LOAD
    :parameters (?p - place ?h - hoist ?c - crate ?t - truck)
    :precondition (and
        (at ?h ?p) (at ?t ?p)
        (lifting ?h ?c)
        (clear ?t) ; Truck deck must be clear
    )
    :effect (and
        (available ?h)
        (not (lifting ?h ?c))
        (on ?c ?t)
        (clear ?c)
        (not (clear ?t))
        (at ?c ?p) ; Crate location set when dropped
        (increase (total-cost) 1)
    )
)
)