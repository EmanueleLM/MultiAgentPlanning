(define (domain depots15)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        locateable - object ; Supertype for objects tracked by location
        surface - locateable
        pallet crate - surface
        truck hoist - locateable
    )

    (:predicates
        (at ?o - locateable ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (holding ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    (:functions
        (total-cost) - number
    )

    (:action drive-truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and 
            (at ?t ?p1) 
            (not (= ?p1 ?p2))
        )
        :effect (and 
            (at ?t ?p2) 
            (not (at ?t ?p1))
            (increase (total-cost) 1)
        )
    )

    (:action lift-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (holding ?h ?c)
            (not (available ?h))
            (not (on ?c ?s))
            (clear ?s)
            (not (clear ?c))
            (not (at ?c ?p)) ; The crate is not at the place while lifted (as per spec)
            (increase (total-cost) 1)
        )
    )

    (:action drop-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (holding ?h ?c)
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (holding ?h ?c))
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
            (at ?c ?p) ; Restore location upon dropping
            (increase (total-cost) 1)
        )
    )

    (:action load-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (holding ?h ?c)
            (at ?h ?p)
            (at ?t ?p)
            ; (at ?c ?p) is not required, as it was removed by lift/unload
        )
        :effect (and
            (available ?h)
            (in ?c ?t)
            (not (holding ?h ?c))
            (increase (total-cost) 1)
        )
    )

    (:action unload-crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
        )
        :effect (and
            (holding ?h ?c)
            (not (available ?h))
            (not (in ?c ?t))
            ; Crate location remains tracked by (holding ?h ?c) until dropped
            (increase (total-cost) 1)
        )
    )