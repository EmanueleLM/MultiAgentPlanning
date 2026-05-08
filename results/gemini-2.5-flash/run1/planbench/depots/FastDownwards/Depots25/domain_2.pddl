(define (domain Depots25)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        surface - object
        crate - surface
        pallet - surface
        truck - object
        hoist - object
    )
    (:predicates
        (at ?o - (either crate pallet truck hoist) ?p - place) ; FIX: Corrected syntax for multiple types
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (on ?c1 - crate ?s2 - surface)
        (in ?c - crate ?t - truck)
    )

    ;; 1. Drive Truck (from P1 to P2)
    (:action drive-truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    ;; 2. Lift Crate (by Hoist H, from Surface S, at Place P)
    (:action lift-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; The surface from which the crate is lifted must also be at the place
            (available ?h)
            (clear ?c) ; Nothing is on the crate being lifted
            (on ?c ?s) ; The crate c is currently on surface s
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; Surface s becomes clear as crate c is lifted from it
            (not (on ?c ?s))
        )
    )

    ;; 3. Drop Crate (by Hoist H, to Surface S, at Place P)
    (:action drop-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The target surface must be at the place
            (clear ?s) ; The target surface must be clear to receive the crate
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)
            (not (clear ?s)) ; Surface s is no longer clear as crate c is dropped onto it
            (clear ?c) ; Crate c is now on surface s, and nothing is on crate c
            (on ?c ?s)
        )
    )

    ;; 4. Load Crate (by Hoist H, onto Truck T, at Place P)
    ;; Inferred effects based on standard logistics domain: Crate no longer at place P.
    (:action load-crate
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
            (not (at ?c ?p)) ; Crate is now in the truck, not at the place
        )
    )

    ;; 5. Unload Crate (by Hoist H, from Truck T, at Place P)
    ;; Inferred effects based on standard logistics domain: Crate becomes at place P, but still lifted.
    (:action unload-crate
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
            (at ?c ?p) ; Crate is now at the place, being lifted
        )
    )
)