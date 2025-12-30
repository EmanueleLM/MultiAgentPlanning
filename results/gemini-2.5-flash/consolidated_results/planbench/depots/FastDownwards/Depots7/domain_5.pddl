(define (domain depots-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        depot distributor - place
        locatable
        surface - locatable
        pallet crate - surface
        truck - locatable
        hoist - locatable
    )

    (:predicates
        (at ?x - locatable ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (holding ?h - hoist ?c - crate)
    )

    (:functions
        (total-cost)
    )

    ;; Action 1: Drive Truck
    (:action drive
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
            (not (at ?c ?p))
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
            (at ?c ?p)
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
            (not (at ?c ?p))
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
            (at ?c ?p)
            (increase (total-cost) 1)
        )
    )
)