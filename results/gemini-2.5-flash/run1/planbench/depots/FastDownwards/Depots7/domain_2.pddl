(define (domain Depots7)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place surface
        depot distributor - place
        pallet crate - surface
        truck hoist
    )
    (:predicates
        (at ?obj - (either crate truck hoist pallet) ?loc - place) ; Fixed syntax: (or ...) -> (either ...)
        (on ?c - crate ?s - surface) ; ?c is on top of ?s
        (clear ?s - surface) ; True if nothing is on top of this surface
        (available ?h - hoist) ; Hoist ?h is available for use
        (holding ?h - hoist ?c - crate) ; Hoist ?h is holding crate ?c
        (in ?c - crate ?t - truck) ; Crate ?c is inside truck ?t
    )
    (:functions
        (total-cost)
    )

    ;; Action: Drive a truck from one place to another
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Lift a crate from a surface using a hoist
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p) ; Crate must be at the place
            (at ?s ?p) ; Surface must be at the place
            (available ?h)
            (on ?c ?s)
            (clear ?c) ; The crate must be the topmost item on a stack to be lifted
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (on ?c ?s))
            (clear ?s) ; The surface ?s from which the crate was lifted is now clear
            (not (clear ?c)) ; The crate ?c is now held and not a stable surface for stacking
            (not (at ?c ?p)) ; The crate is no longer "at" the place in terms of resting on a surface
            (increase (total-cost) 1)
        )
    )

    ;; Action: Drop a crate onto a surface using a hoist
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (holding ?h ?c)
            (clear ?s) ; Must drop onto a clear surface
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (on ?c ?s)
            (not (clear ?s)) ; Surface ?s is no longer clear
            (clear ?c) ; The crate ?c is now on a surface and is clear (nothing on it)
            (at ?c ?p) ; The crate is now "at" the place, resting on a surface
            (increase (total-cost) 1)
        )
    )

    ;; Action: Load a crate from a hoist into a truck
    ;; Human specification had incomplete effects, inferred based on inverse of unload and general logistics
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (holding ?h ?c)
            ; Removed (not (clear ?c)) as it's implied by (holding ?h ?c) and not explicitly in human spec for precondition
        )
        :effect (and
            (available ?h) ; Hoist becomes available
            (not (holding ?h ?c)) ; Hoist stops holding the crate
            (in ?c ?t) ; Crate is now in the truck
            (not (clear ?c)) ; Crate in truck is also not a stackable surface (consistent with holding)
            (increase (total-cost) 1)
        )
    )

    ;; Action: Unload a crate from a truck into a hoist
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (available ?h))
            (holding ?h ?c)
            (not (in ?c ?t))
            (not (clear ?c)) ; Crate is now held by hoist, so not a stable surface
            (increase (total-cost) 1)
        )
    )
)