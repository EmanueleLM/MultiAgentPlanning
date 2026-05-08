(define (domain depots-6)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location - object
        place - location
        depot distributor - place

        surface - object
        pallet crate - surface

        vehicle - object
        truck - vehicle

        hoist - object
    )

    (:predicates
        (at ?x - object ?l - location)
        (connected ?l1 - location ?l2 - location)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Drive action (Truck movement)
    (:action drive
        :parameters (?t - truck ?l1 - location ?l2 - location)
        :precondition (and
            (at ?t ?l1)
            (connected ?l1 ?l2)
        )
        :effect (and
            (at ?t ?l2)
            (not (at ?t ?l1))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift action (Crate movement by Hoist from a Surface)
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?c ?l)
            (at ?s ?l) ; Ensure surface is co-located
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (lifting ?h ?c)
            (not (available ?h))
            (not (on ?c ?s))
            (not (clear ?c))
            (clear ?s)
            (not (at ?c ?l)) ; Added: "the crate is not at the place" (Strict adherence)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Drop action (Crate movement by Hoist onto a Surface)
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?l)
            (at ?s ?l)
            (clear ?s)
        )
        :effect (and
            (on ?c ?s)
            (at ?c ?l) ; Crate returns to the place
            (clear ?c)
            (available ?h)
            (not (lifting ?h ?c))
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Load action (Crate onto Truck via Hoist)
    ;; Pre: Hoist is lifting the crate.
    ;; The crate must have been lifted previously, thus it is (not (at ?c ?l)).
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?l)
            (at ?t ?l)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (not (at ?c ?l)) ; Redundant if lift was used, but ensures consistency
            (increase (total-cost) 1)
        )
    )

    ;; 5. Unload action (Crate from Truck via Hoist)
    ;; Pre: Hoist is available, Crate is in truck.
    ;; Effect: Hoist is now lifting the crate. (STRICT ADHERENCE to human constraints)
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?l - location)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?t ?l)
            (in ?c ?t)
        )
        :effect (and
            (lifting ?h ?c)
            (not (in ?c ?t))
            (not (available ?h))
            ; The crate remains (not (at ?c ?l)) until dropped.
            (increase (total-cost) 1)
        )
    )
)