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
    ;; Restriction: A truck can be driven from one place to another place only if the truck is at the origin place.
    ;; Effect: Once a truck has been driven from one place to another, it is not at the origin place and is at the destination place.
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
    ;; Restriction: Hoist at same place as crate, hoist is available, crate is clear.
    ;; Effect: Crate not at place, hoist lifting crate, hoist not available, surface is clear, crate not on surface.
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
            (not (at ?c ?p)) ; Enforcing requirement: Crate is not at the place once lifted.
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Drop Crate from Hoist onto Surface
    ;; Restriction: Hoist and surface are both at the place, surface is clear, hoist is lifting the crate.
    ;; Effect: Hoist available, hoist not lifting, crate is at the place, surface not clear, crate is clear, crate is on surface.
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
            (at ?c ?p) ; Enforcing requirement: Crate returns to the place once dropped.
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Load Crate from Hoist into Truck
    ;; Restriction: Hoist at same place, truck at same place, hoist lifting the crate.
    ;; Inferred Effects: Hoist available, not holding, crate in truck, crate not at place.
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
    ;; Restriction: Hoist at same place as truck, hoist available, crate in truck.
    ;; Effect: Crate not in truck, hoist not available, hoist is lifting the crate (and crate is now at the place).
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