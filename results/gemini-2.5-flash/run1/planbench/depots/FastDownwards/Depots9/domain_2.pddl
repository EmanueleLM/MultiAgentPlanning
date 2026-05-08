(define (domain Depots9)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )

    (:predicates
        ; Corrected syntax for 'at' predicate to use (either ...) type
        (at ?o - (either crate truck hoist pallet) ?p - place) ; Location of objects that can be moved or are fixed to a place
        (connected ?p1 ?p2 - place) ; Road connectivity
        (available ?h - hoist) ; Hoist is not busy
        (on ?c - crate ?s - surface) ; Crate ?c is on surface ?s
        (in ?c - crate ?t - truck) ; Crate ?c is inside truck ?t
        (holding ?h - hoist ?c - crate) ; Hoist ?h is holding crate ?c
        (clear ?s - surface) ; Surface ?s has nothing on it
    )

    (:action DRIVE
        :parameters (?t - truck ?p1 ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (connected ?p1 ?p2)
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c) ; Crate ?c itself has nothing on it
        )
        :effect (and
            (not (on ?c ?s))
            (clear ?s) ; Surface ?s is now clear
            (not (available ?h))
            (holding ?h ?c)
            (not (at ?c ?p)) ; Crate is now with the hoist, not at the location on the ground
        )
    )

    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (holding ?h ?c)
            (clear ?s) ; Target surface ?s must be clear
            (at ?s ?p) ; Target surface must be at the same location
        )
        :effect (and
            (not (holding ?h ?c))
            (available ?h)
            (at ?c ?p) ; Crate is now at the location on the ground
            (on ?c ?s)
            (not (clear ?s)) ; Surface ?s is no longer clear
            (clear ?c) ; Crate ?c itself is clear once dropped
        )
    )

    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (holding ?h ?c)
        )
        :effect (and
            (not (holding ?h ?c))
            (in ?c ?t)
            (available ?h)
        )
    )

    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
            (available ?h)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (holding ?h ?c)
            ; Removed (at ?c ?p) to maintain consistency with LIFT, where a held crate is not 'at the place' (i.e., not on the ground).
        )
    )