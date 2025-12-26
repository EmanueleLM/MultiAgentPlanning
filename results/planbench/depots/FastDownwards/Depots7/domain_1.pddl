(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )

    (:predicates
        (at ?x - (either truck hoist pallet crate) ?p - place)
        (on ?c - crate ?s - surface) ; ?c is on ?s (S can be a pallet or another crate)
        (in ?c - crate ?t - truck)
        (clear ?s - surface) ; No item is stacked on ?s
        (available ?h - hoist) ; Hoist is idle
        (holding ?h - hoist ?c - crate) ; Hoist holds crate
    )

    (:functions
        (total-cost)
    )

    ;; Action 1: Drive Truck
    (:action drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (not (equal ?p1 ?p2))
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Lift Crate from Surface onto Hoist
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (on ?c ?s))
            (not (clear ?c))
            (clear ?s)
            (not (available ?h))
            (holding ?h ?c)
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Drop Crate from Hoist onto Surface
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
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Load Crate from Hoist into Truck
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
            (not (at ?c ?p)) ; Crate leaves the ground location when loaded
            (increase (total-cost) 1)
        )
    )

    ;; Action 5: Unload Crate from Truck onto Hoist
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (holding ?h ?c)
            (not (in ?c ?t))
            (not (available ?h))
            (at ?c ?p) ; Crate returns to the location P, held by H
            (increase (total-cost) 1)
        )
    )
)