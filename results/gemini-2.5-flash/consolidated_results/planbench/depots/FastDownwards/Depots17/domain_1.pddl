(define (domain Depots17)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types 
        place - object
        depot distributor - place
        truck hoist - object
        cargo - object
        crate pallet - cargo
    )

    (:predicates
        (at ?c - (either cargo truck hoist) ?p - place)
        (road ?p1 - place ?p2 - place)
        (available ?h - hoist)
        (clear ?c - cargo) ; True if nothing is stacked on ?c
        (on ?c1 - crate ?c2 - cargo) ; c1 is stacked on c2 (c2 can be crate or pallet)
        (in ?c - crate ?t - truck) ; Crate is loaded in truck
        (lifting ?h - hoist ?c - crate) ; Hoist is holding crate
    )

    (:functions
        (total-cost) - number
    )

    ; --- Movement Actions ---

    (:action Drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and 
            (at ?t ?p1)
            (road ?p1 ?p2)
        )
        :effect (and 
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    ; --- Handling Actions (Stacking/Unstacking at locations) ---

    ; Lift a clear crate C from C2 (which is on the ground at P)
    (:action Lift-Crate
        :parameters (?h - hoist ?c - crate ?c2 - cargo ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p)
            (at ?c2 ?p)
            (on ?c ?c2)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (not (at ?c ?p)) 
            (not (on ?c ?c2))
            (clear ?c2)
            (lifting ?h ?c)
            (increase (total-cost) 1)
        )
    )

    ; Drop a held crate C onto a clear surface C2 (pallet or crate)
    (:action Drop-Crate
        :parameters (?h - hoist ?c - crate ?c2 - cargo ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?c2 ?p)
            (clear ?c2)
        )
        :effect (and
            (available ?h)
            (at ?c ?p)
            (on ?c ?c2)
            (not (lifting ?h ?c))
            (not (clear ?c2))
            (increase (total-cost) 1)
        )
    )

    ; --- Handling Actions (Loading/Unloading Trucks) ---

    ; Load a held crate C onto truck T
    (:action Load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?t ?p)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )

    ; Unload crate C from truck T using hoist H
    (:action Unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
        )
        :effect (and
            (lifting ?h ?c)
            (not (available ?h))
            (not (in ?c ?t))
            (increase (total-cost) 1)
        )
    )
)