(define (domain depots9)
    (:requirements :typing :negative-preconditions :action-costs)

    (:types
        depot distributor - place
        crate pallet - surface
        truck hoist - object
    )

    (:predicates
        (at ?o - object ?p - place)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (holding ?h - hoist ?c - crate)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Drive Truck
    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift Crate from Surface (Pallet or Crate)
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (on ?c ?s)
            (clear ?c)
            (available ?h)
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (on ?c ?s))
            (not (clear ?c))
            (clear ?s)
            (not (at ?c ?p))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Drop Crate onto Surface (Pallet or Crate)
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (holding ?h ?c)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )

    ;; 4. Load Crate into Truck (requires hoist holding crate)
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (holding ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (in ?c ?t)
            (increase (total-cost) 1)
        )
    )

    ;; 5. Unload Crate from Truck (requires hoist available)
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
            (available ?h)
        )
        :effect (and
            (holding ?h ?c)
            (not (available ?h))
            (not (in ?c ?t))
            (increase (total-cost) 1)
        )
    )
)